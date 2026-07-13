---
command: /smoke-check
phase: qa
primary_owner: qa-tester
---

# /smoke-check — Run a Smoke Test

**Purpose:** Quickly verify core flows still work after a deploy.

## Inputs
- A freshly deployed build

## Steps
1. Run through critical user flows (login, checkout, core action)
2. Flag any breakage immediately

## Outputs
- Pass/fail smoke test result

## Agents Invoked
- qa-tester
- automation-engineer
