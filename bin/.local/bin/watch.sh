#!/bin/bash
#
# watch.sh
#
# receives a command as argument and repeatedly watches it every 1s
# when the command has no more output, sends a notification and exits

CMD=$(cat)

if [[ -z "$CMD" ]]; then
	CMD="$1"
fi

if [[ -z "$CMD" ]]; then
	printf "No command provided."
	exit 1
fi

CMD="$CMD | rg -v 'rg'"

start=$(date +%s)

while true; do
	OUTPUT=$(eval "$CMD")

	if [[ -z "$OUTPUT" ]]; then
		notify-send "Command is finished: $CMD"
		exit
	fi

	time="$(($(date +%s) - "$start"))"
	printf '%s\n' "$(date -u -d "@$time" '+%H:%M:%S')"
	sleep 1
done
