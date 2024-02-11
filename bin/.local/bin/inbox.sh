#!/bin/bash

inbox="$NOTES/0-inbox"

if [[ "$1" == "clean" ]]; then
	echo "Removing files:"
	for file in "$inbox"/*; do
		rm "$file"
		printf "\t%s\n" "$(basename "$file")"
	done
	exit
fi

fd . "$inbox" | xargs nvim
