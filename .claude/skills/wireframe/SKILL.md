---
command: /wireframe
phase: design
primary_owner: design-lead
---

# /wireframe — Create Wireframes

**Purpose:** Produce low-fidelity wireframes for approved user stories/flows before visual design.

## Inputs
- User stories, UX flow

## Steps
1. For each key screen, copy `.claude/docs/templates/wireframe-template.html` to
   `design/wireframes/[screen-name]--[state].html` (one file per screen **and** per
   important state: default, loading, empty, error)
2. Fill in the grayscale placeholder blocks to reflect actual layout and information
   hierarchy — no brand colors, no final copy, no design-system components yet
3. Validate against usability heuristics (is the primary action obvious? is the
   information hierarchy clear? are error/empty states handled, not just the happy path?)
4. Get design-lead sign-off before high-fidelity mockups (`/design-review` handles the
   formal sign-off gate)

## Outputs
- `design/wireframes/[screen-name]--[state].html` — one viewable file per screen/state,
  e.g. `design/wireframes/customer-list--default.html`, `design/wireframes/customer-list--empty.html`

## Agents Invoked
- ui-designer
- ux-researcher
- design-lead
