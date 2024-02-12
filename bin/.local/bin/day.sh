#!/bin/bash
# day.sh
#
# utility for manage daily.md markdown files
# 1. Create note for today if does not exist
# 2. Open today.md in editor

path="$NOTES/2-areas/daily"
day=$(date +"%d/%m")
tomorrow=$(date +"%d/%m" -d "tomorrow")
day_file_format=$(date +"%d-%m")

if [[ -n "$1" ]]; then
	day=$tomorrow
fi

note=$(ls "$path" | grep "day-$day_file_format")

if [ -n "$note" ]; then
	nvim "$path/$note"
	exit
fi

zk new --template="daily.md" -t "Day $day" "$path"
