#!/bin/bash
#
# Creates a new note in inbox
# Opens new note in neovim
#
# if argument is passed, title is arg
# else opens neovim to edit a title
#
# if second arugment is passed, create note in folder

title=""
destination="$NOTES/0-inbox/"

template=$(
	cat <<EOF


# Creating New Note 
# Add title in first line
# Leave empty to cancel
#
# $(date)
EOF
)

if [[ -n "$1" ]]; then
	title="$1"
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

if ! [[ "$2" == "ok" ]]; then
	zk new -t "$title" "$destination" 2>/dev/null
else
	# create note without opening in editor
	new_note=$(zk new -t "$title" -n 2>&1)
	note_path=$(echo "$new_note" | head -n 1 | tr -d '\r')
	note_file=$(basename "$note_path")
	note_content=$(echo "$new_note" | tail -n +2)

	note_path="$destination/$note_file"
	echo "$note_content" >"$note_path"
fi
