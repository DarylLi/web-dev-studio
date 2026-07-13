#!/usr/bin/env bash
# Archives active.md to a session log and records git activity on session close.
ts=$(date +%Y%m%d-%H%M%S)
mkdir -p ../../production/session-state/log
if [ -f ../../production/session-state/active.md ]; then
  cp ../../production/session-state/active.md "../../production/session-state/log/${ts}.md"
fi
exit 0
