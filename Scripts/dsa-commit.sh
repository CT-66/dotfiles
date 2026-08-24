#!/usr/bin/env bash

set -euo pipefail

ROOT="$HOME/Code/DSA"
cd "$ROOT"

# Make sure we're actually inside a Git repository
git rev-parse --show-toplevel >/dev/null 2>&1 || {
    echo "Error: $ROOT is not a Git repository."
    exit 1
}

# Get changed files relative to ROOT.
# We only care about new and modified files.
git status --porcelain=v1 -z |
while IFS= read -r -d '' entry; do
    status="${entry:0:2}"
    file="${entry:3}"

    # Only process added or modified files.
    # ?? = untracked/new file
    # M  /  MM /  M. = modified
    if [[ "$status" != "??" && "$status" != *M* ]]; then
        continue
    fi

    # Get the path relative to ROOT.
    relative="$file"

    # First directory component
    parent="${relative%%/*}"

    # Filename only, regardless of nesting depth
    filename="$(basename -- "$relative")"

    if [[ "$status" == "??" ]]; then
        message="Created $parent: $filename"
    else
        message="Modified $parent: $filename"
    fi

    echo "→ $message"

    git add -- "$relative"
    git commit -m "$message"
done

git push -u origin master
