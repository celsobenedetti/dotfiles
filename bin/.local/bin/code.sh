#!/bin/bash

param="$1"

current_working_directory=$(pwd)
vs_code_directory=/mnt/c/Program\ Files/Microsoft\ VS\ Code/bin

cd "$vs_code_directory" || exit

# if param is empty or param == "."
if [ -z "$param" ] || [ "$param" = "." ]; then
	# if [ -z "$param" ]; then
	./code -n "$current_working_directory"
else
	./code -n "$param"
fi

cd "$current_working_directory" || exit
