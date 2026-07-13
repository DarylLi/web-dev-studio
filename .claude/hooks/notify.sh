#!/usr/bin/env bash
# Cross-platform-ish notification hook; no-op if no supported notifier is found.
title="${1:-Web Dev Studio}"
message="${2:-Claude needs your input}"
if command -v notify-send >/dev/null 2>&1; then
  notify-send "$title" "$message"
elif command -v osascript >/dev/null 2>&1; then
  osascript -e "display notification \"$message\" with title \"$title\""
elif command -v powershell.exe >/dev/null 2>&1; then
  powershell.exe -Command "New-BurntToastNotification -Text '$title','$message'" 2>/dev/null || true
fi
exit 0
