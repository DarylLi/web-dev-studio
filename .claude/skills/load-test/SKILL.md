---
command: /load-test
phase: qa
primary_owner: performance-tester
---

# /load-test — Run a Load/Performance Test

**Purpose:** Validate the system under expected and peak load.

## Inputs
- A staging environment and expected traffic profile

## Steps
1. Design load scenarios (average and peak)
2. Run the test and capture metrics
3. Report bottlenecks and capacity limits

## Outputs
- A load test report

## Agents Invoked
- performance-tester
- backend-lead
- devops-lead
