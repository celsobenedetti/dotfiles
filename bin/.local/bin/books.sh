#!/bin/bash

# books_path="$HOME/Documents/books"
#
# pdfs=$(fd ./*.pdf "$books_path" | sed "s/ /\\ /g")
# epubs=$(fd ./*.epub "$books_path" | sed "s/ /\\ /g")
#
# book=$(
# 	(
# 		echo "$pdfs" &
# 		echo "$epubs"
# 	) | fzf
# )
#
# ext=$(echo "$book" | rev | cut -d "." -f 1 | rev)
# flatpak run com.github.johnfactotum.Foliate
#
# case "$ext" in
# pdf)
# 	echo "$book" | xargs -r -d "\n" evince
# 	;;
# epub)
# 	flatpak run com.github.johnfactotum.Foliate
# 	;;
# esac

# TODO: change this if we can open files in Foliate directly through cli
flatpak run com.github.johnfactotum.Foliate

cd "$NOTES" || exit
make cp
