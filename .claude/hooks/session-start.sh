#!/bin/bash
set -euo pipefail

# Only run in Claude Code remote (web) sessions
if [ "${CLAUDE_CODE_REMOTE:-}" != "true" ]; then
  exit 0
fi

REPO_DIR="${CLAUDE_PROJECT_DIR:-.}"

echo "=== dpm-sites session primer ==="
echo "Sites hub for Douglas McGowan's web deployments."
echo "Live: https://dpm-sites.vercel.app"
echo "Repo: douglaspmcgowan/dpm-sites"
echo ""
echo "-- Recent commits --"
git -C "$REPO_DIR" log --oneline -5 2>/dev/null || true
echo ""
echo "-- Uncommitted changes --"
git -C "$REPO_DIR" status --short 2>/dev/null || true
echo ""
echo "CLAUDE.md describes all sites, skills, playbooks, and hooks."
echo "Run /update-sites-hub to refresh project status and dates."
echo "================================"
