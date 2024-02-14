#!/bin/bash

inbox="$NOTES/0-inbox"

check_empty_inbox() {
	if ! ls "$inbox"/*.md >/dev/null 2>&1; then
		echo "inbox is empty"
		exit 1
	fi
}

clean() {
	check_empty_inbox
	echo "removing files:"
	for file in "$inbox"/*; do
		rm "$file"
		printf "\t%s\n" "$(basename "$file")"
	done
}

open_all() {
	check_empty_inbox
	fd . "$inbox" | xargs nvim
}

interact_with_preview() {
	check_empty_inbox
	zk edit --sort modified -i "$inbox"
}

count() {
	echo "$(fd . "$inbox" --type=file | wc -l) notes"
}

case "$1" in
clean)
	clean
	;;
edit | e*)
	open_all
	;;
recent | tree | count | r* | t* | c*)
	exa --tree --sort=modified --reverse "$inbox"
	count
	;;
*)
	interact_with_preview
	;;
esac
