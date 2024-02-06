#!/bin/bash
#
# Lists note w/ PARA tree structure
# You can pass an argument that will be pattern matched to the substrings of the PARA categories:
# "projects", "areas","resources", "archives", "work"
# The match may be called an "anchored substring pattern matching" from the beggining of the string

path="$HOME/Documents/notes/"

projects="$path/1-projects"
areas="$path/2-areas"
resources="$path/3-resources"
archives="$path/4-archives"

work="$areas/work"

case "$1" in
projects | p*)
	path=$projects
	;;
arq* | 4)
	path=$archives
	;;
areas | a*)
	path=$areas
	;;
resources | r*)
	path=$resources
	;;
work | w*)
	path=$work
	;;
esac

ignore='.git*|README.md'

exa --tree --level=2 --sort=type "$path" -I "$ignore"
