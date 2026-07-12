#!/bin/bash
# Auto-push the Witt dashboard to GitHub Pages.
# Safe to run repeatedly: commits/pushes only when something changed.
cd /Users/melissawitt/Documents/GitHub/teamwitt || exit 1

git add -A

# Only commit + push if there are staged changes.
if ! git diff --cached --quiet; then
  git commit -m "Auto-update dashboard - $(date '+%Y-%m-%d %H:%M')"
  git push origin main
  echo "$(date '+%Y-%m-%d %H:%M') pushed changes"
else
  echo "$(date '+%Y-%m-%d %H:%M') no changes"
fi
