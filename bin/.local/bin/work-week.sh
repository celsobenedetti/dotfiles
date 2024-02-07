#!/bin/bash

last_monday=$(date -d "last Monday" "+%y-%m-%d")

ordered_work_weeks="$(
	fd . "$WORK" --type f |
		rg "work-week" |
		awk -F 'work-week-' '{print $2}' |
		cut -d '.' -f 1 |
		sort -r

)"

if [ -n "$1" ]; then
	zk new -t "Work Week $last_monday" "$WORK/weeks/"
	exit 0
fi

latest_week=$(echo "$ordered_work_weeks" | awk 'NR==1')

if echo "$latest_week" | grep -q "$last_monday"; then
	fd . "$WORK" | rg "$latest_week" | xargs nvim
else
	zk new -t "Work Week $last_monday" "$WORK/weeks/"
fi
