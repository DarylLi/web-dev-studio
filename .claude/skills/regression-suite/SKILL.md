---
command: /regression-suite
phase: qa
primary_owner: automation-engineer
---

# /regression-suite — Maintain the Regression Suite

**Purpose:** Keep the automated regression suite current as features change.

## Inputs
- Recent feature changes

## Steps
1. Add/update automated tests for changed behavior
2. Remove/flag obsolete tests
3. Check suite run time and flakiness

## Outputs
- Updated automated test suite

## Agents Invoked
- automation-engineer
