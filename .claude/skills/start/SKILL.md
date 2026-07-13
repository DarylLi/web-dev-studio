---
command: /start
phase: onboarding
primary_owner: delivery-manager
---

# /start — Start / Route the Project

**Purpose:** Figure out where the project is (idea, PRD exists, code exists) and route to the right next command.

## Inputs
- Answers to: do you have an idea / a PRD / existing code?

## Steps
1. Ask the user which stage they're at (no idea / vague concept / PRD ready / existing codebase)
2. If no idea: route to /brainstorm
3. If PRD ready but no design: route to /design-system + /wireframe
4. If design ready but no architecture: route to /create-architecture
5. If existing codebase: route to /project-stage-detect first

## Outputs
- A recommended next command and why

## Agents Invoked
- delivery-manager
