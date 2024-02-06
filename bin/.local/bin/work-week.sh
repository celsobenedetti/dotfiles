#!/bin/bash

last_monday=$(date -d "last Monday" "+%y-%m-%d")

zk new -t "Work Week $last_monday" "$WORK"
