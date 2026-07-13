# Web Dev Studio — Master Configuration

Turn this Claude Code session into a small, coordinated web development studio:
Product → Design → Frontend/Backend Engineering → QA → Release, with directors,
leads, and specialists mirroring how a real product team is organized.

## Studio Hierarchy

```
Tier 1 — Directors (Opus)
  product-director      tech-director        delivery-manager

Tier 2 — Department Leads (Sonnet)
  product-lead           design-lead          frontend-lead
  backend-lead           qa-lead              devops-lead

Tier 3 — Specialists (Sonnet/Haiku)
  business-analyst        ux-researcher         ui-designer
  ux-writer                accessibility-specialist
  frontend-developer      mobile-web-developer  frontend-performance-engineer
  backend-developer       api-designer          database-engineer
  security-engineer
  devops-engineer          release-engineer
  qa-tester                automation-engineer   performance-tester
```

Full agent definitions live in `.claude/agents/`.

## Agent Coordination Rules

1. **Vertical delegation** — directors delegate to leads, leads delegate to specialists.
2. **Horizontal consultation** — same-tier agents may consult each other but cannot make
   binding cross-domain decisions on their own.
3. **Conflict resolution** — disagreements escalate to the shared parent:
   product-related conflicts → `product-director`; technical conflicts → `tech-director`;
   scheduling/scope conflicts → `delivery-manager`.
4. **Change propagation** — cross-department changes (e.g. a design change that affects
   the API contract) are coordinated by `delivery-manager`.
5. **Domain boundaries** — agents don't edit files outside their domain without explicit
   delegation (e.g. a frontend agent shouldn't rewrite a database migration).

## Collaborative, Not Autonomous

This is not an auto-pilot system:

1. **Ask** — agents ask clarifying questions before proposing solutions.
2. **Present options** — when there's a real tradeoff, show 2-4 options with pros/cons.
3. **You decide** — the user (or the delegating lead/director) makes the call.
4. **Draft** — agents show their work before finalizing.
5. **Approve** — nothing is written/committed without sign-off.

## The 7-Phase Pipeline

See `.claude/docs/workflow-catalog.yaml` for the full command catalog. At a glance:

1. **Discover** — `/brainstorm`, `/prd`
2. **Define** — `/user-stories`, `/prioritize`, `/roadmap`
3. **Design** — `/design-system`, `/wireframe`, `/ux-review`, `/design-review`
4. **Architect** — `/create-architecture`, `/api-design`, `/db-schema`, `/architecture-review`, `/infra-setup`
5. **Build** — `/create-epics`, `/create-stories`, `/dev-story`, `/sprint-plan`, `/code-review`
6. **Verify** — `/test-plan`, `/test-case`, `/bug-report`, `/regression-suite`, `/smoke-check`, `/load-test`
7. **Ship** — `/release-checklist`, `/deploy`, `/changelog`, `/hotfix`

Team orchestration commands (`/team-feature`, `/team-release`, `/team-bugfix`, `/team-audit`)
coordinate multiple agents at once for common cross-cutting workflows.

## Review Intensity

Set in `production/review-mode.txt`, or override per-run with `--review <mode>` on any skill:

- `full` — all director/lead gates run (default; best for production-bound work)
- `lean` — only phase-end gates run (design-review, code-review, story-done)
- `solo` — no gates; useful for prototypes and throwaway spikes

## Hard Gate: No Code Before Product / Design / Architecture Docs

`.claude/hooks/require-design-docs.sh` runs before every `Write`/`Edit` call and
**blocks the write** unless the right upstream artifacts exist:

**For any code under `src/frontend/**` or `src/backend/**`:**
- a PRD under `design/` (e.g. `design/prd/*.md`) — produced by `/prd`
- `docs/architecture.md` — produced by `/create-architecture`

**Additionally for `src/frontend/**` (UI implementation):**
- `design/design-system.html` — a viewable style guide, produced by `/design-system`
- at least one wireframe under `design/wireframes/*.html` — produced by `/wireframe`
- at least one high-fidelity mockup under `design/mockups/*.html` — produced by `/design-review`
- `production/design-review-signoff.md` — written by `/design-review` once the design is approved

All UI design deliverables are **real, openable HTML files** (grayscale wireframes →
on-brand mockups built from the design-system tokens), not text descriptions — see
`.claude/docs/templates/design-system-template.html`, `wireframe-template.html`, and
`mockup-template.html` for the starting skeletons each command copies and fills in.

**Additionally for `src/backend/**`:**
- an API spec under `docs/` or `design/api/` — produced by `/api-design`

This exists specifically so a casual, free-text request like *"生成一个CRM的简单初始项目..."*
can't skip straight to scaffolding `src/frontend` and `src/backend` without product, design,
and architecture decisions behind it — even if Claude judges the request as "simple." In
particular, this closes the gap where frontend code got written before any wireframe,
design-system, or design-review sign-off existed.

**Bypassing it on purpose:**
- Prototypes/spikes under `prototypes/**` are always exempt — that's what the folder is for.
- Set `production/review-mode.txt` to `solo` to disable the gate project-wide (quick personal
  experiments where you don't want any process overhead).
- There's no per-command bypass flag for this specific gate (unlike the softer review gates) —
  it's meant to be a real stop, not a suggestion.

## Path-Scoped Rules

Coding standards are enforced automatically based on file location — see `.claude/rules/`:

| Path | Enforces |
|---|---|
| `src/frontend/**` | Design-system tokens, accessibility, tests required, no direct data fetching in components |
| `src/backend/**` | Input validation, parameterized queries, tests, no hardcoded secrets |
| `docs/api-spec/**`, `src/backend/api/**` | Documented endpoints, consistent error shape, versioning |
| `src/backend/migrations/**`, `db/**` | Rollback required, no destructive migrations without sign-off |
| `design/**` | All UI states covered, design-system reuse, WCAG 2.1 AA contrast |
| `tests/**` | Behavior-named tests, regression test per bug fix |
| `infra/**`, `.github/workflows/**` | DevOps review, no plaintext secrets, release checklist required |
| `prototypes/**` | Relaxed — README + hypothesis required, not importable into `src/` directly |

## Project Structure

```
CLAUDE.md                  # This file
docker-compose.yml          # Local/staging orchestration (frontend + backend + db)
Jenkinsfile                 # CI/CD pipeline definition
.env.example                # Environment variable template (never commit real .env)
.dockerignore
infra/
  docker/                    # Dockerfile.frontend, Dockerfile.backend, nginx.conf
  README.md                  # How to run docker compose / wire up Jenkins
.claude/
  agents/                  # Agent definitions (directors / leads / specialists)
  skills/                  # Slash commands, one folder per command
  hooks/                   # Session/validation automation
  rules/                   # Path-scoped coding standards
  docs/
    workflow-catalog.yaml   # Full 7-phase command catalog
    templates/              # PRD, user story, ADR, API spec, test plan, bug report,
                             # release checklist, design-system/wireframe/mockup HTML
src/
  frontend/                 # Client-side app code
  backend/                  # Server-side app code
design/                     # PRDs, design system, wireframes, mockups
docs/                       # Architecture docs, ADRs, API specs
tests/                      # Unit / integration / E2E / performance tests
production/                 # Sprint plans, epics, stories, session state
prototypes/                 # Throwaway spikes
```

## Getting Started

Run `/start` — it asks where you are (no idea / vague concept / PRD ready / existing
codebase) and routes you to the right next command. Or jump straight to a command if
you already know what you need, e.g. `/prd`, `/design-system`, `/create-architecture`.
