# Release Checklist: [version/date]

- [ ] Regression suite passing
- [ ] Security audit clean (or risks accepted)
- [ ] Migrations reviewed and backward compatible
- [ ] Rollback plan documented
- [ ] Changelog written
- [ ] Monitoring/alerts in place for new features
- [ ] Docker images build cleanly (`docker compose build`)
- [ ] Jenkins pipeline green on the release branch
- [ ] `.env.example` reflects any new environment variables
- [ ] QA sign-off
- [ ] DevOps sign-off
