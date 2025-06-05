# TalentRecruiting

A decentralized platform for candidate endorsement using blockchain technology.

## Overview

TalentRecruiting enables organizations to register candidates and gather endorsements in a transparent, immutable way. The system ensures that each recruiter can only endorse one candidate at a time, maintaining hiring integrity while providing clear metrics on candidate popularity for recruitment decisions.

## Features

- **Candidate Registration**: Any organization can register a new candidate
- **Transparent Endorsements**: All endorsements for candidates are recorded on the blockchain
- **One Endorsement Per Recruiter**: Each recruiter can only endorse one candidate at a time
- **Endorsement Tracking**: Real-time tracking of endorsement counts for each candidate
- **Recruitment Metrics**: Easy access to candidate counts and endorsement statistics

## Functions

### Public Functions

- `register-candidate`: Register a new candidate for consideration
- `endorse-candidate`: Provide your endorsement for an existing candidate

### Read-Only Functions

- `get-endorsement-count`: View the total endorsements for a specific candidate
- `has-endorsed`: Check if a recruiter has already endorsed a candidate
- `get-candidate-count`: Get the total number of candidates registered
- `compare-qualified`: Utility function to compare two values

## Getting Started

1. Deploy the contract to your blockchain
2. Organizations can begin registering candidates
3. Recruiters can endorse candidates they believe are qualified
4. Track candidate endorsements to determine hiring priorities

## Use Cases

- Talent recruitment and candidate selection
- Professional endorsement networks
- Hiring process transparency
- Decentralized recruitment management

## Security

The system ensures recruitment integrity by limiting each recruiter to endorsing only one candidate at a time, preventing manipulation of hiring decisions.