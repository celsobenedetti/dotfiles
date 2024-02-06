#!/bin/bash

export WORK=~/Documents/notes/2-areas/work/

# search all work-week files and sort dates by latest
ordered_work_weeks=$(
	fd . $WORK --type f |
		rg "work-week" |
		awk -F 'work-week-' '{print $2}' |
		cut -d '.' -f 1 |
		sort -r
)

# get latest work-week date
curr_work_date=$(echo "$ordered_work_weeks" | awk 'NR==1')

echo curr work-week file
fd . "$WORK" | rg "$curr_work_date"
