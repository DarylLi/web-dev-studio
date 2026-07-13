---
command: /deploy
phase: release
primary_owner: devops-lead
---

# /deploy — Deploy to an Environment

**Purpose:** Deploy the approved build to staging or production.

## Inputs
- An approved release candidate

## Steps
1. Confirm release checklist is complete
2. Run the deployment via CI/CD
3. Verify post-deploy smoke test and monitoring

## Outputs
- A deployed release + deployment log

## Agents Invoked
- devops-engineer
- devops-lead
- qa-tester
