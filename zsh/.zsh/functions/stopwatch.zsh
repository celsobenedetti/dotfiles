#!/bin/bash

# accepts an argument, counts down from it
countdown() {
    start="$(( $(date '+%s') + $1))"
    while [ $start -ge $(date +%s) ]; do
        time="$(( $start - $(date +%s) ))"
        printf '%s\r' "$(date -u -d "@$time" +%H:%M:%S)"
        sleep 0.1
    done
}

# real time stopwatch
stopwatch() {
    start=$(date +%s)
    while true; do
        time="$(( $(date +%s) - $start))"
        printf '%s\n' "$(date -u -d "@$time" +%H:%M:%S)"
        sleep 1
    done
}

# kill stopwatch process, usefull to be executed after long running process 
# the stopwatch on separate terminal will be killed, keeping track of how long it took
#
# 1. Run stopwatch as such. It needs to be through zsh so the "stopwatch" aliases is associated with the PID
# zsh -c source ~/.zshrc; stopwatch 
#
# 2. On separate terminal long running process with stopwatchkill after
# gunzip < bigdump.sql | docker exec -i mysqlcontainer mysql -uuser -ppass db && stopwatchkill
#
stopwatchkill() {
    pgrep -af stopwatch | awk '{print $1}' | xargs kill
}
