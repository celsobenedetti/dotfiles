#!/bin/bash
#
# Creates a new note in inbox
# Opens new note in neovim
#
# if argument is passed, title is arg
# else opens neovim to edit a title
#
# if second arugment is passed, create note in folder

template=$(
	cat <<EOF


# Creating New Note 
# Add title in first line
# $(date)
EOF
)

TITLE=""

if [[ -n "$1" ]]; then
	TITLE=$1
else
	temp='/tmp/note'
	echo "$template" >"$temp"
	nvim -c 'set filetype=gitcommit' "$temp"
	TITLE=$(head -n 1 "$temp" | Title)
fi

if [[ -z $TITLE ]]; then
	exit 0
fi

if [[ -n "$2" ]]; then
	zk new -t "$TITLE" "$2" 2>/dev/null
else
	zk new -t "$TITLE" "$NOTES/0-inbox/" 2>/dev/null
fi
