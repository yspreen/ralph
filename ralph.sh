#!/bin/sh

CLAUDE_TIMEOUT=900  # seconds (15 minutes)

[ -f readme.md ] && grep ralph.webp readme.md >/dev/null && rm readme.md
[ -f ralph.webp ] && rm ralph.webp

setup_hooks() {
	rm -rf .git/hooks 2>/dev/null
	ln -s ../hooks .git/hooks
}
[ -d hooks ] && [ -d .git ] && setup_hooks

run_cycle() {
	if [ -f blocker.md ]
	then
		claude --dangerously-skip-permissions -p "$(cat blocked-prompt.md)"
		rm blocker.md
	else
		claude --dangerously-skip-permissions -p "$(cat prompt.md)"
	fi
}

while ! [ -f done.txt ]
do
	run_cycle &
	pid=$!
	(sleep "$CLAUDE_TIMEOUT" && kill "$pid" 2>/dev/null) &
	killer=$!
	wait "$pid"
	kill "$killer" 2>/dev/null
	wait "$killer" 2>/dev/null
done
