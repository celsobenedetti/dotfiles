#!/bin/bash

work_dir=~/Documents/notes/2-areas/work/
last_monday=$(date -d "last Monday" "+%y-%m-%d")

zk new -t "Work Week $last_monday" "$work_dir"
