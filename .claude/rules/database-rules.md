# Path: src/backend/migrations/** and db/**

- Every migration must include a rollback/down migration.
- No destructive migrations (drop column/table) without a backup step and database-engineer sign-off.
- New tables/columns require an index review if used in query filters.
