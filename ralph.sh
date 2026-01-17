#!/bin/sh

[ -f readme.md ] && rm readme.md

while ! [ -f done.txt ]
do
	cat prompt.md | claude --dangerously-skip-permissions
done
