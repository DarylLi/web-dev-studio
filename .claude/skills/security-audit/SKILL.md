---
command: /security-audit
phase: review
primary_owner: security-engineer
---

# /security-audit — Run a Security Audit

**Purpose:** Audit authentication, authorization, input validation, and dependencies for vulnerabilities.

## Inputs
- Codebase or a specific PR

## Steps
1. Check authn/authz logic
2. Check input validation and injection risks
3. Scan dependencies for known vulnerabilities
4. Report findings ranked by severity

## Outputs
- A security audit report

## Agents Invoked
- security-engineer
