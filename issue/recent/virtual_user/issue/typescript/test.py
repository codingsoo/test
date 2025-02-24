import json
import os
import re
import shutil

def get_timestamp_from_filename(filename):
    # Extract timestamp from filename (e.g., "20250219_085511")
    match = re.search(r'(\d{8}_\d{6})', filename)
    return match.group(1) if match else None

def read_and_match_files():
    virtual_user_dir = '/mnt/efs/people/mysoo/CodeAssistBench/issue/recent/virtual_user/typescript'
    msg_filter_dir = '/mnt/efs/people/mysoo/CodeAssistBench/issue/recent/msg_filter/typescript'
    
    # Create unmatched directory
    unmatched_dir = 'unmatched'
    if os.path.exists(unmatched_dir):
        shutil.rmtree(unmatched_dir)
    os.makedirs(unmatched_dir)
    
    # Process each virtual user file
    for vu_file in os.listdir(virtual_user_dir):
        if not vu_file.endswith('.json'):
            continue
            
        timestamp = get_timestamp_from_filename(vu_file)
        if not timestamp:
            continue
            
        # Find corresponding GitHub issue file
        github_issue_file = vu_file.replace('virtual_user_', 'github_issues_')
        corresponding_path = os.path.join(msg_filter_dir, github_issue_file)
        
        # Lists to store matched and unmatched issues for this file
        matched_issues = []
        unmatched_issues = []
        
        # Read virtual user file
        with open(os.path.join(virtual_user_dir, vu_file), 'r', encoding='utf-8') as f:
            try:
                virtual_users = json.load(f)
            except json.JSONDecodeError:
                print(f"Error reading {vu_file}")
                continue
        
        # Read corresponding GitHub issue file
        if os.path.exists(corresponding_path):
            with open(corresponding_path, 'r', encoding='utf-8') as f:
                try:
                    github_issues = json.load(f)
                except json.JSONDecodeError:
                    print(f"Error reading {github_issue_file}")
                    continue
                    
            # Create lookup dictionary for virtual users
            vu_lookup = {vu['id']: True for vu in virtual_users}
            
            # Match and store issues
            for issue in github_issues:
                if issue['url'] in vu_lookup:
                    matched_issues.append(issue)
                else:
                    unmatched_issues.append(issue)
            
            # Write matched issues to file in current directory
            if matched_issues:
                with open(github_issue_file, 'w', encoding='utf-8') as f:
                    json.dump(matched_issues, f, indent=2)
                print(f"Matched issues have been saved to {github_issue_file}")
            
            # Write unmatched issues to file in unmatched directory
            if unmatched_issues:
                unmatched_file_path = os.path.join(unmatched_dir, github_issue_file)
                with open(unmatched_file_path, 'w', encoding='utf-8') as f:
                    json.dump(unmatched_issues, f, indent=2)
                print(f"Unmatched issues have been saved to {unmatched_file_path}")

if __name__ == "__main__":
    read_and_match_files()