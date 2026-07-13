#!/usr/bin/env bash
# Preserves session progress notes before context compaction.
mkdir -p ../../production/session-state
cp ../../production/session-state/active.md ../../production/session-state/active.pre-compact.md 2>/dev/null || true
exit 0
