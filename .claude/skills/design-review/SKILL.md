---
command: /design-review
phase: design
primary_owner: design-lead
---

# /design-review — Full Design Review

**Purpose:** Formal design gate review before a feature moves to engineering handoff.

## Inputs
- Approved wireframes (`design/wireframes/*.html`)
- Approved design system (`design/design-system.html`)

## Steps
1. If not already done, produce high-fidelity mockups: for each approved wireframe, copy
   `.claude/docs/templates/mockup-template.html` to `design/mockups/[screen-name]--[state].html`,
   inline the real `:root` token block from `design/design-system.html`, and build the
   styled version of that screen/state using it
2. Check design-system consistency (are mockups actually using the tokens/components,
   not ad-hoc values?)
3. Check all states are covered (loading/empty/error) in the mockups, matching the wireframes
4. Check accessibility (contrast, focus order) — coordinate with accessibility-specialist
5. Approve or send back with specific asks
6. If approved, write/append `production/design-review-signoff.md` (feature name, date,
   reviewer, scope covered, list of approved mockup files) — this file is what unblocks
   frontend implementation via `.claude/hooks/require-design-docs.sh`

## Outputs
- `design/mockups/[screen-name]--[state].html` — viewable, on-brand high-fidelity mockups
- Sign-off recorded in `production/design-review-signoff.md`, or a list of required changes if not approved

## Agents Invoked
- design-lead
- accessibility-specialist
