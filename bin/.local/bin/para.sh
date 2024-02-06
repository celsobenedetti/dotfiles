#!/bin/bash
#
# Lists note w/ PARA tree structure

ignore='.git*|README.md|todo.md|done.md'

exa --tree --level=2 --sort=type ~/Documents/notes/ -I "$ignore"
