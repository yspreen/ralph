#!/bin/sh

CLAUDE_TIMEOUT=600  # seconds (10 minutes)

# Resolve the script's directory robustly
SCRIPT_DIR="$( cd -- "$( dirname -- "${BASH_SOURCE[0]:-$0}"; )" &> /dev/null && pwd 2> /dev/null; )";

# Change to the script's directory
cd "$SCRIPT_DIR" || exit 1

run_clod() {
	claude --dangerously-skip-permissions -p "$1" &
	pid=$!
	(sleep "$CLAUDE_TIMEOUT" && kill "$pid" 2>/dev/null) &
	killer=$!
	wait "$pid"
	status=$?
	kill "$killer" 2>/dev/null
	wait "$killer" 2>/dev/null
	return $status
}

if [ "$1" = "1" ]; then
	run_clod "Go into all step files (except 1, that's just init) and break down the existing substeps into smaller more straight forward steps"
elif [ "$1" = "2" ]; then
	run_clod "Go into all step files (except 1, that's just init) and make sure that our definition of DONE is precise enough. Tests can never mock away any critical functionality. Ensure mocks are clearly for isolation, not for skipping hard tests. 100 tests passing means nothing if those tests use mocks for the critical path"
elif [ "$1" = "3" ]; then
	run_clod "Go into all step files (except 1, that's just init) and make sure that any time we read/write env vars for local dev or any secrets, we use ./secrets.txt and don't create multiple sources of truth for those values"
elif [ "$1" = "4" ] && [ -d proj ]; then
	run_clod "Go into all step files (except 1, that's just init) and make sure that all source code is explicityly written in ./proj inside this repo. If there are multiple sub components, it would be ./proj/nextjs, ./proj/hono etc."
else
	exit 0
fi

if [ $? -ne 0 ]; then
	echo "Errir: No messages returned"
	exit 1
fi

echo DONE! Please mark this sub step as done in ./progress.txt
echo Add progress.txt to git staged changes, as well as all changed step md files.
echo Then commit, push, end turn.
