---
command: /story-done
phase: delivery
primary_owner: qa-lead
---

# /story-done — Mark a Story Done

**Purpose:** Verify a story meets its acceptance criteria and definition of done before closing it.

## Inputs
- A completed PR for a story

## Steps
1. Verify acceptance criteria are met
2. Confirm tests pass and coverage is adequate
3. Confirm design-review sign-off if UI changed

## Outputs
- Story marked done, or sent back with a specific gap list

## Agents Invoked
- qa-tester
- qa-lead
