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

work="$areas/work-quarter"
ocelot="$resources/ocelot"
daily="$areas/daily"

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
daily | d*)
	path=$daily
	;;
esac

# Define ignore patterns in an array
ignore=(
	'4-archives'
	'2024.md'
	'README.md'
	'todo.md'
	'chores.md'
	'books.md'
	'movies.md'
	'done.md'
	'Makefile'
	'hugo'
	'_index.md'
)

# Join patterns with '|' separator
ignore_pattern=$(
	IFS="|"
	echo "${ignore[*]}"
)
exa --tree --sort=type --icons --level="$depth" -I="$ignore_pattern" "$path"
