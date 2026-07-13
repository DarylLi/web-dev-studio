---
command: /team-bugfix
phase: orchestration
primary_owner: qa-lead
---

# /team-bugfix — Orchestrate a Bug Fix

**Purpose:** Coordinate triage through fix through verification for a reported bug.

## Inputs
- A bug report

## Steps
1. qa-lead triages severity and owner
2. owning developer (frontend/backend) implements the fix
3. qa-tester verifies the fix
4. automation-engineer adds a regression test

## Outputs
- A verified, regression-covered fix

## Agents Invoked
- qa-lead
- frontend-developer
- backend-developer
- qa-tester
- automation-engineer
