#!/bin/bash
# Auto-push the Witt dashboard to GitHub Pages.
# Safe to run repeatedly: commits when something changed, and always
# pushes any unpushed commits (a no-op if already up to date).
cd /Users/melissawitt/Documents/GitHub/teamwitt || exit 1

git add -A

if ! git diff --cached --quiet; then
  git commit -m "Auto-update dashboard - $(date '+%Y-%m-%d %H:%M')"
  echo "$(date '+%Y-%m-%d %H:%M') committed changes"
else
  echo "$(date '+%Y-%m-%d %H:%M') no new changes to commit"
fi

# Always try to push — sends any local commits that haven't reached GitHub yet.
git push origin main
