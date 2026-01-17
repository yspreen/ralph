#!/bin/sh

[ -f readme.md ] && rm readme.md

setup_hooks() {
	rm -rf .git/hooks 2>/dev/null
	ln -s ../hooks .git/hooks
}
[ -d hooks ] && [ -d .git ] && setup_hooks

while ! [ -f done.txt ]
do
	claude --dangerously-skip-permissions -p "$(cat prompt.md)"
done
