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

OUTPUT_FILE=$(mktemp)

while ! [ -f done.txt ]
do
	run_cycle > "$OUTPUT_FILE" 2>&1 &
	pid=$!
	(sleep "$CLAUDE_TIMEOUT" && kill "$pid" 2>/dev/null) &
	killer=$!
	# Monitor output for "No messages returned" error
	(while kill -0 "$pid" 2>/dev/null; do
		if grep -q "No messages returned" "$OUTPUT_FILE" 2>/dev/null; then
			kill "$pid" 2>/dev/null
			break
		fi
		sleep 1
	done) &
	monitor=$!
	wait "$pid"
	kill "$killer" 2>/dev/null
	kill "$monitor" 2>/dev/null
	wait "$killer" 2>/dev/null
	wait "$monitor" 2>/dev/null
	cat "$OUTPUT_FILE"
	> "$OUTPUT_FILE"
done

rm -f "$OUTPUT_FILE"
