#!/usr/bin/env bash
# PreToolUse(Write|Edit) hook.
# Blocks writing implementation code under src/frontend/** or src/backend/**
# until the right upstream docs exist. Prototypes are exempt.
#
# Expects the target file path as $1 (passed in by Claude Code's hook invocation).
file="$1"

is_frontend=false
is_backend=false
case "$file" in
  *"src/frontend/"*) is_frontend=true ;;
  *"src/backend/"*)  is_backend=true ;;
  *) exit 0 ;;   # everything else passes through untouched
esac

# Allow prototypes/spikes to bypass — they're explicitly throwaway.
case "$file" in
  *"/prototypes/"*) exit 0 ;;
esac

# Allow bypass if review-mode is set to "solo" (explicit opt-out for quick spikes).
review_mode="full"
if [ -f "production/review-mode.txt" ]; then
  review_mode="$(tr -d '[:space:]' < production/review-mode.txt)"
fi
if [ "$review_mode" = "solo" ]; then
  exit 0
fi

missing=()

# ---- Required for ANY implementation code (frontend or backend) ----
if ! find design -maxdepth 2 -iname 'prd*.md' 2>/dev/null | grep -q .; then
  missing+=("No PRD found under design/ — run /prd first.")
fi

if [ ! -f "docs/architecture.md" ]; then
  missing+=("No docs/architecture.md found — run /create-architecture first.")
fi

# ---- Additional gate for FRONTEND code: UI design must exist first ----
if $is_frontend; then
  if [ ! -f "design/design-system.html" ]; then
    missing+=("No design/design-system.html found — run /design-system first.")
  fi

  if ! find design/wireframes -maxdepth 1 -iname '*.html' 2>/dev/null | grep -q .; then
    missing+=("No wireframes found under design/wireframes/*.html — run /wireframe first.")
  fi

  if ! find design/mockups -maxdepth 1 -iname '*.html' 2>/dev/null | grep -q .; then
    missing+=("No high-fidelity mockups found under design/mockups/*.html — run /design-review first.")
  fi

  if [ ! -f "production/design-review-signoff.md" ]; then
    missing+=("No production/design-review-signoff.md found — run /design-review and record sign-off before implementing UI.")
  fi
fi

# ---- Additional gate for BACKEND code: API contract must exist first ----
if $is_backend; then
  if ! find docs design/api -maxdepth 2 -iname '*api-spec*' -o -maxdepth 2 -iname 'openapi*' 2>/dev/null | grep -q .; then
    missing+=("No API spec found under docs/ or design/api/ — run /api-design first.")
  fi
fi

if [ ${#missing[@]} -gt 0 ]; then
  echo "BLOCKED: attempted to write implementation code before the required upstream docs exist:" >&2
  for m in "${missing[@]}"; do echo "  - $m" >&2; done
  echo "" >&2
  echo "If this is intentional (e.g. a quick spike), set production/review-mode.txt to 'solo' or move the work into prototypes/ instead." >&2
  exit 2   # non-zero + exit code 2 tells Claude Code to block the tool call
fi

exit 0
