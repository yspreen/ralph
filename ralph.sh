while ! -f done.txt
do
	cat prompt.md | claude --dangerously-skip-permissions
done
