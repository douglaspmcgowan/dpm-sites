#!/bin/bash
# Require an explicit plan before writing or editing sensitive Claude config files.
# Exit 2 blocks the tool call and surfaces the message to Claude.

input=$(cat)
tool_name=$(echo "$input" | jq -r '.tool_name // empty')

# Only intercept Write and Edit
if [[ "$tool_name" != "Write" && "$tool_name" != "Edit" ]]; then
  exit 0
fi

file_path=$(echo "$input" | jq -r '.tool_input.file_path // empty')
if [ -z "$file_path" ]; then
  exit 0
fi

is_sensitive=false

# .claude/settings.json or settings.local.json (project or global)
if echo "$file_path" | grep -qE '/\.claude/settings(\.local)?\.json$'; then
  is_sensitive=true
fi

# CLAUDE.md at any depth
if echo "$file_path" | grep -qE '(^|/)CLAUDE\.md$'; then
  is_sensitive=true
fi

# Any file inside a .claude/hooks/ directory
if echo "$file_path" | grep -qE '/\.claude/hooks/'; then
  is_sensitive=true
fi

# Any file inside a .claude/skills/ directory
if echo "$file_path" | grep -qE '/\.claude/skills/'; then
  is_sensitive=true
fi

# Global ~/.claude/ tree (root or any user home)
if echo "$file_path" | grep -qE '^(/root|/home/[^/]+)/\.claude/'; then
  is_sensitive=true
fi

if [ "$is_sensitive" = true ]; then
  echo "PLAN REQUIRED before modifying '$file_path'." >&2
  echo "This is a sensitive Claude config file. Before writing or editing it, you must:" >&2
  echo "  1. Tell the user which files you intend to change" >&2
  echo "  2. Describe exactly what you will change and why" >&2
  echo "  3. Wait for the user to explicitly approve the plan" >&2
  echo "Do not retry this write until the user has approved." >&2
  exit 2
fi

exit 0
