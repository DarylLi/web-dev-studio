---
command: /sprint-plan
phase: delivery
primary_owner: delivery-manager
---

# /sprint-plan — Plan a Sprint

**Purpose:** Select stories for the upcoming sprint based on priority and team capacity.

## Inputs
- Prioritized backlog, team capacity

## Steps
1. Pull top-priority ready stories up to capacity
2. Confirm no unresolved dependencies
3. Publish the sprint plan

## Outputs
- production/sprint-plan.md

## Agents Invoked
- delivery-manager
- product-lead
- frontend-lead
- backend-lead
- qa-lead
