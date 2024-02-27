#!/bin/bash
# zz.sh - Utility for searching Zettlekasten notes
#
# Search through zk notes interactively, with the possibility to specify tags
#

if [ -z "$1" ]; then
	zk edit -i
	exit
fi

if [ "$1" = "-t" ] || [ "$1" == "t" ]; then
	tag=$(zk tag | fzf | awk '{print $1}')
	zk edit -i -t "$tag"
	exit
fi

zk edit -i -t "$1"
