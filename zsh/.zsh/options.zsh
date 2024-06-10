#!/bin/bash
export EDITOR='nvim'
export NOTES="$HOME/notes"
export TODO="$NOTES/2-areas/todo.md"
export DAILY="$NOTES/daily"


WW=$(fd . "$DAILY" --type f  | rg week | sort | tail -n 1)
TODAY=$(fd . "$DAILY" --type f  | rg day | sort | tail -n 1)
export WW
