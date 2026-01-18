#!/bin/sh

curl 'https://raw.githubusercontent.com/yspreen/ralph/refs/heads/main/entry.md' > entry.md
curl 'https://raw.githubusercontent.com/yspreen/ralph/refs/heads/main/progress.txt' > progress.txt
curl 'https://raw.githubusercontent.com/yspreen/ralph/refs/heads/main/step-1.md' > step-1.md
git rm step-*.md done.txt blocker.md
git add entry.md progress.txt
git commit -m "Run a ralph reset."

echo "Now update userinput.txt and run ralph.sh again."
