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
fleeting_note=false # skip editor for note content
destination="$NOTES/0-inbox"
title_editor='/tmp/title_editor'

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
	echo "$title_editor_templ" >"$title_editor"
	nvim -c 'set filetype=gitcommit' "$title_editor"
	title=$(head -n 1 "$title_editor")
	fleeting_note=$(awk 'NR==2 {print $1}' "$title_editor" | grep -q . && echo true)
fi

echo "$title_editor_templ" >"$title_editor" # reset title_editor
title=$(echo "$title" | Title)

if [[ -z $title ]]; then
	exit 0
fi

# create note without opening in editor
write-fleeting-note() {
	new_note=$(zk new -t "$title" --template=fleeting-note.md -n 2>&1)
	note_path=$(echo "$new_note" | head -n 1 | tr -d '\r')
	note_file=$(basename "$note_path")
	note_content=$(echo "$new_note" | tail -n +2)

	note_path="$destination/$note_file"
	echo "$note_content" >"$note_path"
	exit

}

if [[ "$fleeting_note" == true || -n "$2" ]]; then
	write-fleeting-note
fi

zk new -t "$title" "$destination" 2>/dev/null
