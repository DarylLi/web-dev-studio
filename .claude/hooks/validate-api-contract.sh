#!/usr/bin/env bash
# PostToolUse(Write/Edit) hook. Exits early unless the file is an API spec/schema.
file="$1"
case "$file" in
  *api-spec*|*openapi*|*schema*) ;;
  *) exit 0 ;;
esac
if command -v python3 >/dev/null 2>&1 && [[ "$file" == *.json ]]; then
  python3 -c "import json,sys; json.load(open('$file'))" 2>/dev/null || echo "Warning: $file is not valid JSON." >&2
fi
exit 0
