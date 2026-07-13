---
command: /api-design
phase: architecture
primary_owner: backend-lead
---

# /api-design — Design the API Contract

**Purpose:** Define REST/GraphQL endpoints, payloads, error formats, and versioning before implementation starts.

## Inputs
- User stories, data model needs

## Steps
1. List required endpoints/operations and their payloads
2. Define error format and status code conventions
3. Define versioning strategy
4. Review with frontend-lead for usability

## Outputs
- docs/api-spec.md or OpenAPI schema

## Agents Invoked
- api-designer
- backend-lead
- frontend-lead
