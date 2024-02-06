#!/bin/bash
#
# Creates a new note in inbox
# Opens new note in neovim
#
# if argument is passed, title is arg
# else opens neovim to edit a title

# TODO: ability to edit second line and add path to zk new
# TODO: Extra lines will be added as content

TITLE=""

if [[ -n "$1" ]]; then
	TITLE=$1
else
	temp='/tmp/note'

	# Clear the first line using sed
	sed -i '1s/.*//' "$temp" 2>/dev/null

	nvim -c 'set filetype=gitcommit' "$temp"
	TITLE=$(head -n 1 "$temp")
fi

if [[ -z $TITLE ]]; then
	exit 0
fi

zk new -t "$TITLE" "$HOME/Documents/notes/0-inbox/" 2>/dev/null
