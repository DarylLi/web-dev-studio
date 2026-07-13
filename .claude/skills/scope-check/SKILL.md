---
command: /scope-check
phase: review
primary_owner: delivery-manager
---

# /scope-check — Check Scope Creep

**Purpose:** Compare current implementation scope against the original story/PRD to flag drift.

## Inputs
- A story/PRD and current implementation

## Steps
1. Compare implemented scope vs agreed scope
2. Flag additions/omissions
3. Recommend accept, trim, or formally re-scope

## Outputs
- A scope diff report

## Agents Invoked
- delivery-manager
- product-lead
