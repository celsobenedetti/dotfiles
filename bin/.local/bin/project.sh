#!/bin/bash

# Creates a new note in inbox
# Opens new note in neovim
#
# if argument is passed, title is arg
# else opens neovim to edit a title
#
# if second arugment is passed, create note in folder

title=""
projects="$NOTES/1-projects"
project_editor='/tmp/project_editor'

project_templ=$(
	cat <<EOF



# Creating New Project
# Add Title in 1st line
# Add Abstract to 3rd line
# Leave empty to cancel
#
# $(date)
EOF
)

if [[ -n "$1" ]]; then
	title="$1"
else
	echo "$project_templ" >"$project_editor"
	nvim -c 'set filetype=gitcommit' "$project_editor"

	title=$(head -n 1 "$project_editor")
	abstract=$(sed -n 3p "$project_editor")
fi

echo "$project_templ" >"$project_editor" # reset project_editor
title=$(echo "$title" | Title)

if [[ -z $title ]]; then
	exit 0
fi

if [[ -n "$2" ]]; then
	abstract="$2"
fi

destination="$projects/$(echo "$title" | Title -s)"

mkdir "$destination"

echo "$abstract" | zk new \
	--template=project.md \
	-i \
	-t \
	"$title" \
	"$destination" \
	2>/dev/null
