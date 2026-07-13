---
command: /architecture-review
phase: architecture
primary_owner: tech-director
---

# /architecture-review — Review Architecture / an ADR

**Purpose:** Sanity-check a proposed architecture decision before it's locked in.

## Inputs
- A draft ADR or architecture proposal

## Steps
1. Check tradeoffs are actually compared, not just asserted
2. Check for scalability/security/maintainability gaps
3. Approve, request changes, or reject with reasoning

## Outputs
- Approved ADR or a list of required revisions

## Agents Invoked
- tech-director
- security-engineer
