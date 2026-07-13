#!/usr/bin/env bash
# PreToolUse(Bash) hook. Warns on pushes to protected branches.
cmd="$1"
case "$cmd" in
  *"git push"*) ;;
  *) exit 0 ;;
esac
if echo "$cmd" | grep -qE "(main|master|production)"; then
  echo "Warning: pushing directly to a protected branch. Confirm this is intended (PR + review recommended)." >&2
fi
exit 0
