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

edit() {
	check_empty_inbox
	fd . "$inbox" | xargs nvim
}

print() {
	check_empty_inbox
	exa --tree "$inbox"
}

case "$1" in
clean | c*)
	clean
	;;
edit | e*)
	edit
	;;
*)
	print
	;;
esac
