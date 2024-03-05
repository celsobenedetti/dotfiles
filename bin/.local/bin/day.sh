#!/bin/bash
#
# utility for manage daily.md markdown files
# 1. If "$1" is not passed, open latest daily note
# 2. Else Create new daily note for today or tomorrow
#   a) today if note doesn't exist for today
#   b) tomorrow if today already exists

path="$DAILY"
template="today.md"

latest=$(
	ls "$path" |
		grep -vE "week|$(date +%Y)" |
		awk -F "_" '{print $2}' |
		awk -F "-" '{print $2}' |
		sort -V |
		tail -n 1
)

latest=$(ls "$path" | grep "$latest")

echo "$latest"

if [[ -z "$1" ]]; then
	nvim "$path/$latest"
	exit
fi

day=$(date +"%d-%m")
week_day=$(date +"%A")

if [ "$1" = "tom" ]; then
	day=$(date +"%d-%m" -d "tomorrow")
	week_day=$(date +"%A" -d "tomorrow")
	template="tomorrow.md"
fi

if [ "$1" = "tod" ] || [ "$1" = "today" ]; then
	day=$(date +"%d-%m")
	week_day=$(date +"%A")
fi

# NOTE: gave up on this numbering thing, lets see how it goes
# day_number=$(fd md "$path" | grep -c -v "week")
# day_number=$((day_number + 1))

# substitute - with / for better readability
day=$(echo "$day" | sed 's/-/\//g')

zk new \
	--template="$template" \
	-t "$week_day $day" \
	"$path"
