#!/bin/bash
export EDITOR='nvim'
export NOTES="$HOME/Documents/notes"
export TODO="$NOTES/2-areas/todo.md"
export WORK="$NOTES/2-areas/work/"

WW=$(fd . "$WORK" --type f  | rg work-week | sort | tail -n 1)
export WW
