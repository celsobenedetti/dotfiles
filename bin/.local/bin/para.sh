#!/bin/bash
#
# Lists note w/ PARA tree structure
# You can pass an argument that will be pattern matched to the substrings of the PARA categories:
# "projects", "areas","resources", "archives", "work"
# The match may be called an "anchored substring pattern matching" from the beggining of the string

depth="2"
path="$HOME/Documents/notes"

inbox="$path/0-inbox"
projects="$path/1-projects"
areas="$path/2-areas"
resources="$path/3-resources"
archives="$path/4-archives"

work="$areas/work"
ocelot="$resources/ocelot"

case "$1" in
inbox | i* | 0)
	path=$inbox
	;;
projects | p* | 1*)
	path=$projects
	;;
arc* | 4*)
	path=$archives
	;;
areas | a* | 2*)
	path=$areas
	;;
resources | r* | 3*)
	path=$resources
	;;
work | w*)
	path=$work
	;;
ocelot | o*)
	path=$ocelot
	;;
esac

# Define ignore patterns in an array
ignore=(
	'2024.md'
	'README.md'
	'todo.md'
	'chores.md'
	'insights.md'
	'books.md'
	'movies.md'
	'done.md'
	'Makefile'
)

# Join patterns with '|' separator
ignore_pattern=$(
	IFS="|"
	echo "${ignore[*]}"
)
exa --tree --sort=type --level="$depth" -I="$ignore_pattern" "$path"
