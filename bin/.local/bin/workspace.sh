#!/usr/bin/env bash

# Script for "cd"ing around pre-defined list of dirs by creating/attaching to tmux sessions
# Inspired by "tmux-sessionizer" by https://github.com/ThePrimeagen

# if a session was passed as arugment to command
if [[ $# -eq 1 ]]; then
	session=$1
else
	dirs=$(
		fd . ~ ~/projects ~/work ~/Documents/ ~/local/interesting/ ~/local \
			/mnt/c/Users/celso_benedetti/work \
			--min-depth 1 --max-depth 1 --type d 2>/dev/null &
		echo "$HOME/.dotfiles" &
		echo "$HOME/.local/share/nvim/lazy"
	)
	# session=$(echo "$dirs" | fzf-tmux -p 80% --prompt "Open tmux session -> ") # fzf-tmux is a little bit slower than i'd like
	session=$(echo "$dirs" | fzf --prompt "Open tmux session -> ")

fi

# if no session is selected
if [[ -z $session ]]; then
	exit 0
fi

# get last child of dir path
session_name=$(basename "$session" | tr . _)

# enable italics
# export TERM=screen-256color

# if session does not exist
if ! tmux has-session -t="$session_name" 2>/dev/null; then

	if [[ "$session_name" == "chatbot" ]]; then
		chatbot.sh
		exit
	fi

	# if there is a tmuxinator project for this session_name
	if tmuxinator list | awk 'NR>1' | grep -q "^$session_name$"; then
		tmuxinator start "$session_name"
		exit 0
	fi

	tmux new-session -ds "$session_name" -c "$session"
fi

if ! pgrep -x 'tmux' >/dev/null; then
	tmux attach-session -t "$session_name" 2>/dev/null
fi

tmux switch-client -t "$session_name" 2>/dev/null
