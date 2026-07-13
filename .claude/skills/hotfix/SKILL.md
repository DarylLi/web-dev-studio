---
command: /hotfix
phase: release
primary_owner: devops-lead
---

# /hotfix — Ship a Hotfix

**Purpose:** Fast-track a critical fix to production safely.

## Inputs
- A critical production bug

## Steps
1. Confirm the fix is minimal and scoped
2. Fast-track review (security/backend/frontend as relevant)
3. Deploy with heightened monitoring and a ready rollback

## Outputs
- A deployed hotfix + incident note

## Agents Invoked
- backend-developer
- frontend-developer
- devops-lead
- qa-lead
