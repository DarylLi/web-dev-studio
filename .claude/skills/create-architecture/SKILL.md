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
4. **Decide on containerization/deployment scope now, with the user, rather than
   silently picking one:** ask whether to run `/infra-setup` now (full Docker/Compose/
   CI scaffolding, partial "local Docker only", or none) — see the `/infra-setup`
   options. Record whichever answer in `docs/architecture.md` under a "Packaging /
   Deployment" section, explicitly, even if the answer is "deferred — no
   containerization for v1." Don't leave this implicit in a single stack-choices
   table row; a decision that isn't surfaced as a choice isn't really a decision the
   user made.
5. Get tech-director approval

## Outputs
- docs/architecture.md (including the Packaging/Deployment decision from step 4) + docs/adr/*.md
- If containerization was chosen: `/infra-setup` output (infra/docker/*, docker-compose.yml, etc.)
  — either run inline as part of this command or explicitly scheduled as the next step.

## Agents Invoked
- tech-director
- frontend-lead
- backend-lead
- devops-lead
