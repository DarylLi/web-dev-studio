#!/usr/bin/env bash
# PreToolUse(Bash) hook. Exits early unless the command is `git commit`.
cmd="$1"
case "$cmd" in
  *"git commit"*) ;;
  *) exit 0 ;;
esac
if echo "$cmd" | grep -qE "TODO[^:]"; then
  echo "Warning: TODO without a ticket reference found in commit context. Prefer 'TODO(TICKET-123): ...'" >&2
fi
exit 0
