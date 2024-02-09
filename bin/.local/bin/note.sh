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
# Leave empty to cancel
#
# $(date)
EOF
)

title=""

if [[ -n "$1" ]]; then
	title=$1
else
	temp='/tmp/note'
	echo "$template" >"$temp"
	nvim -c 'set filetype=gitcommit' "$temp"
	title=$(head -n 1 "$temp")
fi

title=$(echo "$title" | Title)

if [[ -z $title ]]; then
	exit 0
fi

destination="$NOTES/0-inbox/"

if [[ -n "$2" ]]; then
	destination="$2"
fi

zk new -t "$title" "$destination" 2>/dev/null
