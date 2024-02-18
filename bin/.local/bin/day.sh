#!/bin/bash
# day.sh
#
# utility for manage daily.md markdown files
# 1. Create note for today if does not exist
# 2. Open today.md in editor

path="$NOTES/2-areas/daily"
day=$(date +"%d/%m")
day_file_format=$(date +"%d-%m")

if [[ -n "$1" ]]; then
	day=$(date +"%d/%m" -d "tomorrow")
	day_file_format=$(date +"%d-%m" -d "tomorrow")
fi

note=$(ls "$path" | grep -E "day-([1-9]+)-$day_file_format")

if [ -n "$note" ]; then
	nvim "$path/$note"
	exit
fi

day_number=$(fd "([1-9]+)-(monday|tuesday|wednesday|thursday|friday)" "$path" | wc -l)
day_number=$((day_number + 1))

# TODO: grab day count automatically
# - total days all time
# - total days in current period
zk new --template="daily.md" -t "Today $day_number - $day" "$path"
