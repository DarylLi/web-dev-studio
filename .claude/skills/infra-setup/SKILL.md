---
command: /infra-setup
phase: architecture
primary_owner: devops-lead
---

# /infra-setup — Scaffold Docker / Compose / Jenkins

**Purpose:** Set up (or update) the containerization and CI/CD scaffolding so the
project can be built, run locally, and deployed consistently — Docker images for
frontend/backend, a docker-compose stack for local/staging, and a Jenkins pipeline.

## Inputs
- Approved architecture (`docs/architecture.md`) — needs to state the actual stack
  (runtime, framework, database) so the Dockerfiles/compose match reality

## Steps
1. Copy/adjust `infra/docker/Dockerfile.frontend` and `Dockerfile.backend` to match the
   real framework/build command/runtime chosen in the architecture doc
2. Copy/adjust `docker-compose.yml` at the repo root: services, ports, env vars, and the
   database image actually chosen (Postgres/MySQL/Mongo/etc.)
3. Copy/adjust the root `Jenkinsfile`: registry name, image names, credential IDs, and the
   real deploy mechanism for the `Deploy to Staging` stage
4. Confirm `.env.example` lists every environment variable the app actually needs (without
   real secret values)
5. Verify locally: `docker compose up --build` should bring up a working stack

## Outputs
- `infra/docker/Dockerfile.frontend`, `infra/docker/Dockerfile.backend`, `infra/docker/nginx.conf`
- `docker-compose.yml`, `.env.example`, `.dockerignore` at the repo root
- `Jenkinsfile` at the repo root
- `infra/README.md` kept current with any deviations from the defaults

## Agents Invoked
- devops-lead
- devops-engineer
