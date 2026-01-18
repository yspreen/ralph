#!/bin/sh

curl 'https://raw.githubusercontent.com/yspreen/ralph/refs/heads/main/entry.md' > entry.md
curl 'https://raw.githubusercontent.com/yspreen/ralph/refs/heads/main/progress.txt' > progress.txt
git rm step-*.md 2>/dev/null
curl 'https://raw.githubusercontent.com/yspreen/ralph/refs/heads/main/step-1.md' > step-1.md
[ -f done.txt ] && git rm done.txt
[ -f blocker.md ] && git rm blocker.md
git add entry.md progress.txt
git add step-1.md 2>/dev/null
git commit -m "Run a ralph reset."

echo "Now update userinput.txt and run ralph.sh again."
