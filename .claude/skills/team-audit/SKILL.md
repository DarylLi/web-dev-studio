---
command: /team-audit
phase: orchestration
primary_owner: tech-director
---

# /team-audit — Orchestrate a Pre-Launch Audit

**Purpose:** Run security, performance, and accessibility audits together before a major launch.

## Inputs
- A release candidate near launch

## Steps
1. security-engineer runs a security audit
2. frontend-performance-engineer + performance-tester run perf audits
3. accessibility-specialist runs an accessibility audit
4. tech-director consolidates findings into a go/no-go

## Outputs
- A consolidated pre-launch audit report

## Agents Invoked
- security-engineer
- frontend-performance-engineer
- performance-tester
- accessibility-specialist
- tech-director
