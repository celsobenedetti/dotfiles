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
destination="$NOTES/0-inbox"

title_editor_templ=$(
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
	title_editor='/tmp/title_editor'

	echo "$title_editor_templ" >"$title_editor"
	nvim -c 'set filetype=gitcommit' "$title_editor"
	title=$(head -n 1 "$title_editor")
fi

title=$(echo "$title" | Title)

if [[ -z $title ]]; then
	exit 0
fi

quick-note() {
	# create note without opening in editor
	new_note=$(zk new -t "$title" --template=quick-note.md -n 2>&1)
	note_path=$(echo "$new_note" | head -n 1 | tr -d '\r')
	note_file=$(basename "$note_path")
	note_content=$(echo "$new_note" | tail -n +2)

	note_path="$destination/$note_file"
	echo "$note_content" >"$note_path"
	exit

}

if [[ -n "$2" ]]; then
	quick-note
fi

zk new -t "$title" "$destination" 2>/dev/null
