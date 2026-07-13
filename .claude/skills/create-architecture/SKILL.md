---
command: /create-architecture
phase: architecture
primary_owner: tech-director
---

# /create-architecture — Design System Architecture

**Purpose:** Define the overall technical architecture: frontend framework, backend services, data flow, and key decisions.

## Inputs
- Approved PRD, non-functional requirements

## Steps
1. Choose frontend/backend stack and justify tradeoffs
2. Define service boundaries and data flow
3. Document key architecture decisions as ADRs
4. Get tech-director approval

## Outputs
- docs/architecture.md + docs/adr/*.md

## Agents Invoked
- tech-director
- frontend-lead
- backend-lead
- devops-lead
