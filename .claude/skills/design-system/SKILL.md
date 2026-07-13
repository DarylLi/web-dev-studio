---
command: /design-system
phase: design
primary_owner: design-lead
---

# /design-system — Define/Update the Design System

**Purpose:** Establish (or evolve) shared design tokens and components: color, type, spacing, core components.

## Inputs
- Brand guidelines (if any), PRD

## Steps
1. Copy `.claude/docs/templates/design-system-template.html` to `design/design-system.html`
2. Replace the CSS custom-property tokens (color, spacing, typography, radius, shadow) with
   the real values decided for this project
3. Replace/extend the rendered component samples (buttons, inputs, cards, nav) so every
   state is shown: default, hover, active, disabled, error
4. Open `design/design-system.html` in a browser and confirm it actually looks right —
   don't just eyeball the CSS values

## Outputs
- `design/design-system.html` — a living, viewable style guide (open it in a browser)
- Any project-specific notes/rationale can go in `design/design-system-notes.md` (optional)

## Agents Invoked
- design-lead
- ui-designer
