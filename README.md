# Web Dev Studio

Turn a single Claude Code session into a coordinated web product team —
**Product · Design · Frontend · Backend · QA · DevOps** — modeled after the
Tier 1 / Tier 2 / Tier 3 studio hierarchy pattern (directors → leads → specialists),
adapted from game-dev "studio" agent templates to ordinary web application delivery.

## What's Included

| Category | Count | Description |
|---|---|---|
| Agents | 26 | 3 directors, 6 department leads, 17 specialists across product/design/frontend/backend/devops/QA |
| Skills (slash commands) | 44 | One command per workflow step, plus 4 multi-agent team orchestration commands |
| Hooks | 11 | Session start, gap detection, commit/push validation, API-contract validation, compaction handling, audit trail |
| Rules | 8 | Path-scoped coding standards for frontend, backend, API, database, design, tests, infra, prototypes |
| Templates | 10 | PRD, user story, ADR, API spec, test plan, bug report, release checklist, design-system/wireframe/mockup HTML |
| Infra scaffolding | — | Dockerfile.frontend, Dockerfile.backend, docker-compose.yml, Jenkinsfile, .env.example — see `/infra-setup` |

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

## The 7-Phase Pipeline

1. **Discover** — `/brainstorm`, `/prd`
2. **Define** — `/user-stories`, `/prioritize`, `/roadmap`
3. **Design** — `/design-system`, `/wireframe`, `/ux-review`, `/design-review`
4. **Architect** — `/create-architecture`, `/api-design`, `/db-schema`, `/architecture-review`, `/infra-setup`
5. **Build** — `/create-epics`, `/create-stories`, `/dev-story`, `/sprint-plan`, `/code-review`
6. **Verify** — `/test-plan`, `/test-case`, `/bug-report`, `/regression-suite`, `/smoke-check`, `/load-test`
7. **Ship** — `/release-checklist`, `/deploy`, `/changelog`, `/hotfix`

Team orchestration: `/team-feature`, `/team-release`, `/team-bugfix`, `/team-audit`.

## Getting Started

```bash
git clone <this-repo> my-web-app
cd my-web-app
claude
```

Then run `/start` — it asks where you are (no idea / vague concept / PRD ready /
existing codebase) and routes you to the right first command.

## Collaboration Model

Not autopilot. Every agent: **asks** clarifying questions → **presents options**
with tradeoffs → **you decide** → **drafts** the artifact → **only writes/commits
after approval**. See `CLAUDE.md` for the full coordination and escalation rules.

## Customize

This is a template, not a locked framework:
- Delete agents/skills you don't need; add new ones for your stack.
- Edit `.claude/rules/*.md` to match your actual directory layout and standards.
- Tune `.claude/settings.json` hooks and permissions to your risk tolerance.
- Set `production/review-mode.txt` to `full` / `lean` / `solo` depending on how much
  gate-checking you want (or pass `--review solo` on a single command).
