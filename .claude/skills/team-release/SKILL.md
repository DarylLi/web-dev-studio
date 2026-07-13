---
command: /team-release
phase: orchestration
primary_owner: delivery-manager
---

# /team-release — Orchestrate a Release

**Purpose:** Coordinate everyone needed to ship a release safely.

## Inputs
- A set of features/fixes ready for release

## Steps
1. qa-lead confirms regression suite status
2. security-engineer confirms no open critical findings
3. release-engineer prepares checklist and changelog
4. devops-lead executes the deploy

## Outputs
- A shipped release

## Agents Invoked
- qa-lead
- security-engineer
- release-engineer
- devops-lead
