#!/bin/bash
#
# utility for manage daily.md markdown files
# 1. If "$1" is not passed, open latest daily note
# 2. Else Create new daily note for today or tomorrow
#   a) today if note doesn't exist for today
#   b) tomorrow if today already exists

path="$DAILY"

latest=$(ls "$path" | grep -v "week" | awk -F "_" '{print $2}' | sort | tail -n 1)
latest=$(ls "$path" | grep "$latest")
if [[ -z "$1" ]]; then
	nvim "$path/$latest"
	exit
fi

day=$(date +"%d-%m")
week_day=$(date +"%A")

if echo "$latest" | grep -q "$day"; then
	day=$(date +"%d-%m" -d "tomorrow")
	week_day=$(date +"%A" -d "tomorrow")
fi

day_number=$(fd md "$path" | grep -c -v "week")
day_number=$((day_number + 1))

# substitute - with / for better readability
day=$(echo "$day" | sed 's/-/\//g')

zk new --template="daily.md" -t "$day_number - $week_day $day" "$path"
