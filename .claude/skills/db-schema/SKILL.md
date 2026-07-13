---
command: /db-schema
phase: architecture
primary_owner: backend-lead
---

# /db-schema — Design the Database Schema

**Purpose:** Define tables/collections, relationships, indexes, and migration plan.

## Inputs
- Data requirements from PRD/API design

## Steps
1. Model entities and relationships
2. Define indexes for expected query patterns
3. Write the migration plan (including rollback)

## Outputs
- docs/db-schema.md + migration files

## Agents Invoked
- database-engineer
- backend-lead
