#!/bin/bash
#
# Opens or create week file
#
# Usage:
# week
# week next

#!/bin/bash

curr_monday=$(date -d "last Monday" +"%d/%m")
next_monday=$(date -d "next Monday" +"%d/%m")
curr_friday=$(date -d "last Friday" +"%d/%m")
next_friday=$(date -d "next Friday" +"%d/%m")

latest() {
	ordered_work_weeks="$(
		fd . "$DAILY" --type f |
			rg "week" |
			awk -F 'week-' '{print $2}' |
			cut -d '.' -f 1 |
			sort -r

	)"

	echo "$ordered_work_weeks" | awk 'NR==1'
}

if [ -n "$1" ]; then
	curr_monday=$next_monday
	curr_friday=$next_friday
fi

curr_monday_file=$(echo "$curr_monday" | sed 's/\//-/')

if latest | grep -q "$curr_monday_file"; then
	fd . "$DAILY" | rg "$(latest)" | xargs nvim
else
	zk new --template=week.md -t "Week $curr_monday to $curr_friday" "$DAILY"
fi
