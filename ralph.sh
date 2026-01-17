#!/bin/sh

[ -f readme.md ] && rm readme.md

while ! [ -f done.txt ]
do
	claude --dangerously-skip-permissions -p "$(cat prompt.md)"
done
