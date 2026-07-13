---
command: /project-stage-detect
phase: onboarding
primary_owner: tech-director
---

# /project-stage-detect — Detect Existing Project Stage

**Purpose:** Analyze an existing codebase/repo to infer what's already built and what's missing (PRD, tests, CI, etc).

## Inputs
- Existing repository

## Steps
1. Scan src/, design/, docs/, tests/ for existing artifacts
2. Flag missing design docs, missing tests, missing CI config
3. Recommend which command to run next

## Outputs
- A gap report and recommended next steps

## Agents Invoked
- tech-director
- qa-lead
