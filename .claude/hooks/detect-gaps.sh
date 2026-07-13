#!/usr/bin/env bash
# Runs on session open. Flags missing artifacts (PRD, design, tests, CI).
set -e
missing=()
[ -d "../../design/prd" ] || [ -n "$(find /home -maxdepth 4 -iname 'prd*.md' 2>/dev/null)" ] || missing+=("No PRD found — consider /prd")
[ -d "../../design" ] && [ -z "$(ls -A ../../design 2>/dev/null)" ] && missing+=("design/ is empty — consider /design-system or /wireframe")
[ -d "../../tests" ] && [ -z "$(ls -A ../../tests 2>/dev/null)" ] && missing+=("tests/ is empty — consider /test-plan")
[ -z "$(find . -maxdepth 3 -iname '*.yml' -path '*workflows*' 2>/dev/null)" ] && missing+=("No CI workflow detected — consider setting up CI with devops-lead")

if [ ${#missing[@]} -eq 0 ]; then
  echo "No obvious gaps detected."
else
  echo "Detected gaps:"
  for m in "${missing[@]}"; do echo "  - $m"; done
fi
exit 0
