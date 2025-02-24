"""Bedrock client handling for virtual user generation from GitHub conversations."""
import time
import boto3
import botocore
import json
import logging
import os
import uuid
from pathlib import Path
from typing import Dict, List, Optional
from dataclasses import dataclass

# Configure logging
logging.basicConfig(level=logging.INFO, format='%(asctime)s - %(levelname)s - %(message)s')
logger = logging.getLogger(__name__)

@dataclass
class BedrockConfig:
    """Configuration class."""
    aws_profile: str = "ngde"
    region: str = "us-west-2"
    model_id: str = "us.anthropic.claude-3-5-sonnet-20241022-v2:0"

@dataclass
class VirtualUser:
    """Virtual user data structure."""
    id: str
    source: Dict
    initial_question: Dict
    satisfaction_conditions: List[str]
    created_at: str

    def to_dict(self) -> Dict:
        return {
            "id": self.id,
            "source": self.source,
            "initial_question": self.initial_question,
            "satisfaction_conditions": self.satisfaction_conditions,
            "created_at": self.created_at
        }

class BedrockClient:
    """Client for interacting with AWS Bedrock service."""

    def __init__(self, config: BedrockConfig):
        """Initialize Bedrock client with configuration."""
        self.config = config
        self.client = self._create_client()

    def _create_client(self):
        """Create and configure Bedrock client."""
        boto_config = botocore.config.Config(
            read_timeout=7200,
            connect_timeout=7200,
            retries={"max_attempts": 100}
        )
        session = boto3.Session(
            profile_name=self.config.aws_profile,
            region_name=self.config.region
        )
        return session.client('bedrock-runtime', config=boto_config)

    def generate_message(
        self,
        system_prompt: str,
        user_prompt: str,
        max_tokens: int = 2048,
        max_retries: int = 100,
        retry_delay: int = 10
    ) -> Optional[str]:
        """Generate message using Bedrock model with retry logic."""
        body = {
            "anthropic_version": "bedrock-2023-05-31",
            "max_tokens": max_tokens,
            "messages": [
                {
                    "role": "user",
                    "content": [{
                        "type": "text",
                        "text": user_prompt,
                    }],
                }
            ],
            "system": system_prompt,
            "temperature": 0.0,
            "stop_sequences": ["\n\nHuman:"]
        }

        for attempt in range(max_retries):
            try:
                response = self.client.invoke_model(
                    body=json.dumps(body),
                    modelId=self.config.model_id,
                    accept="application/json",
                    contentType="application/json"
                )
                
                response_body = json.loads(response.get('body').read())
                return response_body["content"][0]["text"]
                
            except Exception as e:
                if attempt < max_retries - 1:
                    logger.warning(f"Retry {attempt + 1}/{max_retries} (Error: {str(e)})")
                    time.sleep(retry_delay)
                else:
                    logger.error(f"Max retries reached. Error: {str(e)}")
                    raise

        return None


class ConversationAnalyzer:
    """Analyzer for GitHub conversations."""

    def __init__(self, bedrock_client: BedrockClient):
        self.bedrock_client = bedrock_client

    def verify_conditions(self, conversation: Dict, conditions: List[Dict]) -> List[str]:
        """Verify which conditions are satisfied in the original conversation."""
        
        verification_prompt = f"""
        Given this GitHub conversation:

        Title: {conversation['title']}
        Question: {conversation['body']}
        Comments: {json.dumps([c['body'] for c in conversation['comments']])}

        And these satisfaction conditions:
        {json.dumps(conditions)}

        For each condition, determine if it is satisfied in the original conversation.
        Return your analysis in this exact JSON format:
        {{
            "verified_conditions": [
                {{
                    "condition": "The condition text",
                    "is_satisfied": true/false,
                    "explanation": "Why this condition is or isn't satisfied based on the conversation"
                }}
            ]
        }}
        
        Only mark a condition as satisfied if there is clear evidence in the conversation that it was met.
        """

        try:
            llm_response = self.bedrock_client.generate_message("", verification_prompt)
            if not llm_response:
                return []

            # Parse response and extract satisfied conditions
            response_data = json.loads(llm_response[llm_response.find('{'):llm_response.rfind('}')+1])
            satisfied_conditions = [
                item['condition'] 
                for item in response_data['verified_conditions'] 
                if item['is_satisfied']
            ]
            
            # Log verification results
            logger.info("Verification results:")
            for item in response_data['verified_conditions']:
                status = "SATISFIED" if item['is_satisfied'] else "NOT SATISFIED"
                logger.info(f"{status}: {item['condition']}")
                logger.info(f"Explanation: {item['explanation']}")
                logger.info("---")
                
            return satisfied_conditions
            
        except Exception as e:
            logger.error(f"Error verifying conditions: {str(e)}")
            return []

    def analyze_conversation(self, conversation: Dict) -> Optional[VirtualUser]:
        """Analyze a conversation and extract satisfaction conditions."""
        
        system_prompt = """
        You are an AI assistant analyzing GitHub questions. Your task is to:
        1. Understand the core requirements of the user's question
        2. Extract general conditions that ANY valid answer must satisfy
        3. Focus on what makes an answer acceptable, not the specific solution given
        
        Do not include conditions that:
        - Go beyond what was actually discussed
        - Assume broader applicability than shown
        - Cannot be verified from the user's response

        For example:
        - Instead of "Run command X", use "Command execution produces expected output"
        - Instead of "Add line Y to config", use "Configuration change resolves the issue"
        - Instead of "Download version 1.2.3", use "Correct version is installed"
        """

        user_prompt = f"""
        Given this GitHub conversation:

        Title: {conversation['title']}
        Question: {conversation['body']}
        Comments: {json.dumps([c['body'] for c in conversation['comments']])}

        Provide general satisfaction conditions with explanations in this exact JSON format:
        {{
            "satisfaction_conditions": [
                {{
                    "condition": "A general condition that ANY valid solution must meet",
                    "explanation": "Why this condition is essential for any valid answer"
                }}
            ]
        }}

        Focus on WHAT needs to be achieved, not HOW it was achieved in this specific answer.
        Each condition should be:
        - General enough to apply to alternative solutions
        - Verifiable through observation or testing
        - Independent of specific implementation details
        """

        try:
            logger.info(f"Generating LLM response for conversation: {conversation['number']}")
            llm_response = self.bedrock_client.generate_message(system_prompt, user_prompt)
            
            if not llm_response:
                logger.error("LLM returned empty response")
                return None

            # Log the raw response
            logger.info(f"Raw LLM response: {llm_response}")

            # Clean up the response
            cleaned_response = llm_response.strip()
            start = cleaned_response.find('{')
            end = cleaned_response.rfind('}') + 1
            
            if start == -1 or end == 0:
                logger.error(f"Could not find JSON object in response: {cleaned_response}")
                return None
                
            json_str = cleaned_response[start:end]
            logger.info(f"Cleaned JSON string: {json_str}")
            
            try:
                response_data = json.loads(json_str)
                if not isinstance(response_data, dict) or 'satisfaction_conditions' not in response_data:
                    logger.error("Invalid JSON structure")
                    return None

                # Verify which conditions are actually satisfied
                satisfied_conditions = self.verify_conditions(conversation, response_data['satisfaction_conditions'])
                
                if not satisfied_conditions:
                    logger.error("No satisfied conditions found")
                    return None

                virtual_user = VirtualUser(
                    id=conversation["url"],
                    source={
                        "issue_number": conversation["number"],
                    },
                    initial_question={
                        "title": conversation["title"],
                        "body": conversation["body"]
                    },
                    satisfaction_conditions=satisfied_conditions,
                    created_at=conversation["created_at"]
                )
                
                logger.info(f"Successfully created virtual user for conversation {conversation['number']}")
                return virtual_user

            except json.JSONDecodeError as e:
                logger.error(f"JSON parsing error: {e}")
                return None

        except Exception as e:
            logger.error(f"Error analyzing conversation {conversation['number']}: {str(e)}")
            return None

def get_output_filename(input_file: str) -> str:
    """Convert input filename to output filename format."""
    base_filename = os.path.basename(input_file)
    parts = base_filename.split('_')
    if len(parts) >= 3:
        relevant_parts = parts[2:]  # Skip 'github' and 'issues'
        return f"virtual_user_{'_'.join(relevant_parts)}"
    else:
        return f"virtual_user_{base_filename}"
    
def process_directory(input_dir: str, bedrock_client: BedrockClient):
    """Process all JSON files in the input directory."""
    logger.info(f"Processing directory: {input_dir}")
    
    json_files = [f for f in os.listdir(input_dir) if f.endswith('.json')]
    logger.info(f"Found {len(json_files)} JSON files")

    for idx, json_file in enumerate(json_files, 1):
        input_file = os.path.join(input_dir, json_file)
        logger.info(f"\nProcessing file {idx}/{len(json_files)}: {json_file}")
        
        try:
            process_conversations(input_file, bedrock_client)
        except Exception as e:
            logger.error(f"Error processing file {json_file}: {str(e)}")
            continue

def process_conversations(input_file: str, bedrock_client: BedrockClient):
    """Process conversations and extract virtual users with satisfaction conditions."""
    try:
        output_file = get_output_filename(input_file)
        
        logger.info(f"Processing {input_file}")
        logger.info(f"Output will be saved to {output_file}")

        with open(input_file, 'r') as f:
            conversations = json.load(f)

        logger.info(f"Loaded {len(conversations)} conversations from input file")

        analyzer = ConversationAnalyzer(bedrock_client)
        virtual_users = []

        for idx, conversation in enumerate(conversations, 1):
            logger.info(f"Processing conversation {idx}/{len(conversations)} (ID: {conversation['number']})")
            virtual_user = analyzer.analyze_conversation(conversation)
            if virtual_user:
                virtual_users.append(virtual_user.to_dict())
                logger.info(f"Added virtual user for conversation {conversation['number']}")
            else:
                logger.warning(f"Failed to create virtual user for conversation {conversation['number']}")

        if virtual_users:
            with open(output_file, 'w') as f:
                json.dump(virtual_users, f, indent=2)
            logger.info(f"Saved {len(virtual_users)} virtual users to {output_file}")
        else:
            logger.warning("No virtual users were created")

        logger.info(f"Processed {len(conversations)} conversations. "
                   f"Created {len(virtual_users)} virtual users.")

    except Exception as e:
        logger.error(f"Error processing file {input_file}: {str(e)}")
        raise

def main():
    # Get input directory from command line argument
    import sys
    if len(sys.argv) != 2:
        print("Usage: python script.py <input_directory>")
        sys.exit(1)

    input_dir = sys.argv[1]

    # Check if directory exists
    if not os.path.isdir(input_dir):
        print(f"Error: {input_dir} is not a directory")
        sys.exit(1)

    # Initialize Bedrock client
    config = BedrockConfig()
    bedrock_client = BedrockClient(config)

    # Process all files in directory
    process_directory(input_dir, bedrock_client)

if __name__ == "__main__":
    main()