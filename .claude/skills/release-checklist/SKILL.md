---
command: /release-checklist
phase: release
primary_owner: release-engineer
---

# /release-checklist — Prepare a Release Checklist

**Purpose:** Make sure nothing is missed before shipping: tests, migrations, feature flags, rollback plan.

## Inputs
- A release candidate

## Steps
1. Confirm regression suite passes
2. Confirm migrations are backward compatible
3. Confirm rollback plan exists
4. Get qa-lead and devops-lead sign-off

## Outputs
- A completed release checklist

## Agents Invoked
- release-engineer
- qa-lead
- devops-lead
