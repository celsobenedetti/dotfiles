#!/bin/bash

books_path="$HOME/Documents/books"

pdfs=$(fd ./*.pdf "$books_path" | sed "s/ /\\ /g")
epubs=$(fd ./*.epub "$books_path" | sed "s/ /\\ /g")
awzs=$(fd ./*.azw3 "$books_path" | sed "s/ /\\ /g")

book=$(
	(
		echo "$pdfs" &
		echo "$epubs" &
		echo "$awzs"
	) | fzf
)

if [[ -z "$book" ]]; then
	exit 0
fi

flatpak run --file-forwarding com.github.johnfactotum.Foliate @@ "$book" @@

cd "$NOTES" || exit
make cp
