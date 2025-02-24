# Repository Structure

## Overview
This repository contains two main directories: `issue` and `repo`, organizing GitHub data based on time periods and filtering stages.

## Directory Structure

### 📁 repo/
Contains repository information categorized by time periods.

#### 📂 all/
- Top 100 starred repositories
- Includes `top_20/` subdirectory with repositories selected based on:
  - Active "help wanted" and "question" issue tags
  - Priority given to repositories with higher issue counts when scores are tied

#### 📂 recent/
- Top 1000 starred repositories created after July 2nd, 2024
- Includes `top_20/` subdirectory with similar selection criteria as `all/`

### 📁 issue/
Contains processed GitHub issues with various filtering stages.

#### Common Structure for both `all/` and `recent/`:
```text
issue/
├── regex_filter/      # Issues after regex filtering
├── conv_filter/       # Issues after conversation filtering
├── msg_filter/        # Issues after message filtering
└── virtual_user/      # Extracted satisfactory conditions
    ├── c/
    ├── c#/
    ├── cpp/
    ├── java/
    ├── javascript/
    ├── python/
    └── typescript/

Each programming language directory contains individual repository files with their respective processed issues.

## Note
The date cutoff (July 2nd, 2024) for recent repositories is specifically chosen to avoid data leakage in model training and evaluation.