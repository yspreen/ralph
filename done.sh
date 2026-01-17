#!/bin/sh

# Resolve the script's directory robustly
SCRIPT_DIR="$( cd -- "$( dirname -- "${BASH_SOURCE[0]:-$0}"; )" &> /dev/null && pwd 2> /dev/null; )";

# Change to the script's directory
cd "$SCRIPT_DIR" || exit 1

touch done.txt
