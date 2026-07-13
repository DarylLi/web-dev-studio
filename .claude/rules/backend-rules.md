# Path: src/backend/**

- All endpoints must validate input and return the agreed error format (see docs/api-spec.md).
- No raw SQL string concatenation — use parameterized queries/ORM.
- Business logic must be covered by unit tests; endpoints by integration tests.
- Secrets/config must come from environment variables, never hardcoded.
- Breaking API changes require api-designer + backend-lead sign-off and a version bump.
