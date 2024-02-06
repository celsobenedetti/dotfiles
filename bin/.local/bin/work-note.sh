#!/bin/bash

if [[ -n $1 ]]; then
	note.sh "$1" "$WORK"
else
	note.sh "" "$WORK"
fi
