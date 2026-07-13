#!/usr/bin/env bash
# Runs when a Claude Code session opens. Shows orientation info.
set -e
echo "== Web Dev Studio =="
if command -v git >/dev/null 2>&1 && git rev-parse --is-inside-work-tree >/dev/null 2>&1; then
  echo "Branch: $(git branch --show-current 2>/dev/null || echo unknown)"
  echo "Recent commits:"
  git log --oneline -5 2>/dev/null || echo "  (no commits yet)"
else
  echo "No git repo detected yet."
fi
exit 0
