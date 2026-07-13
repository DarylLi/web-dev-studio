#!/usr/bin/env bash
# Audit trail: logs subagent invocation stop.
agent="$1"
mkdir -p ../../production/session-state
echo "$(date -u +%FT%TZ) STOP  $agent" >> ../../production/session-state/agent-audit.log
exit 0
