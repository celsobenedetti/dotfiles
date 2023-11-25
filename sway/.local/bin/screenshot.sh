#!/bin/bash

output=$(date +"%Y-%m-%d_%Hh%Mm%Ss")

grim -g "$(slurp)" "/home/celso/Pictures/screenshot/$output.png"

swaynag \
	-t warning \
	-m "Screenshot saved to ~/Pictures/screenshot/$output" \
	--background "#ebbcba" &

sleep 3 && pkill swaynag
