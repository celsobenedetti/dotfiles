#!/bin/bash
#
# Creates a new note in inbox
# Opens new note in neovim
#
# 1. if argument is passed, title is arg
# else opens neovim to edit a title

TITLE=""

if [[ -n "$1" ]]; then
	TITLE=$1
else
	temp='/tmp/note.md'

	rm "$temp" 2>/dev/null
	nvim "$temp"
	TITLE=$(cat "$temp")
	rm "$temp" 2>/dev/null
fi

if [[ -z $TITLE ]]; then
	exit 0
fi

zk new -t "$TITLE" "$HOME/Documents/notes/0-inbox/" 2>/dev/null
