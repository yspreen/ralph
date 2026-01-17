#!/bin/sh

CLAUDE_TIMEOUT=900  # seconds (15 minutes)

[ -f readme.md ] && rm readme.md
[ -f ralph.webp ] && rm ralph.webp

setup_hooks() {
	rm -rf .git/hooks 2>/dev/null
	ln -s ../hooks .git/hooks
}
[ -d hooks ] && [ -d .git ] && setup_hooks

while ! [ -f done.txt ]
do
	claude --dangerously-skip-permissions -p "$(cat prompt.md)" &
	pid=$!
	(sleep "$CLAUDE_TIMEOUT" && kill "$pid" 2>/dev/null) &
	killer=$!
	wait "$pid"
	kill "$killer" 2>/dev/null
done
