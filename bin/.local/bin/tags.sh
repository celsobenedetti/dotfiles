#!/bin/bash
#
# tab.sh
#
# Fuzzy search for zk tag and search through all its notes

tag=$(zk tag |
	fzf |
	awk '{print $1}')

if [ -z "$tag" ]; then
	exit
fi

zk edit -i --sort=modified --tag="$tag"
