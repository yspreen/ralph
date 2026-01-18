#!/bin/sh

# Resolve the script's directory robustly
SCRIPT_DIR="$( cd -- "$( dirname -- "${BASH_SOURCE[0]:-$0}"; )" &> /dev/null && pwd 2> /dev/null; )";

# Change to the script's directory
cd "$SCRIPT_DIR" || exit 1

claude --dangerously-skip-permissions -p "Go into all step files and break down the existing substeps into smaller more straight forward steps"
claude --dangerously-skip-permissions -p "Go into all step files and make sure that our definition of DONE is precise enough. Tests can never mock away any critical functionality. Ensure mocks are clearly for isolation, not for skipping hard tests. 100 tests passing means nothing if those tests use mocks for the critical path"
claude --dangerously-skip-permissions -p "Go into all step files and make sure that any time we read/write env vars for local dev or any secrets, we use ./secrets.txt and don't create multiple sources of truth for those values"
[ -d proj ] && claude --dangerously-skip-permissions -p "Go into all step files and make sure that all source code is explicityly written in ./proj inside this repo. If there are multiple sub components, it would be ./proj/nextjs, ./proj/hono etc."

echo DONE! Please mark the init step as done in ./progress.txt
