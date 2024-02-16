#!/bin/bash

cd ~/work/chatbot/ || exit

branch="$1"

if [ -z "$branch" ]; then
	branch=$(
		git branch \
			-a \
			--sort=-committerdate |
			fzf \
				--header "Chatbot: checkout and pull pull branch -> Run build scripts" \
				--preview "git diff --color=always {1}" |
			sed 's/remotes.origin.//' |
			tr -d " "
	)
fi

if echo "$branch" | grep -q -E "\*"; then
	workspace.sh ~/work/chatbot/
	exit
fi

if [ -z "$branch" ]; then
	echo "No branch selected"
	exit
fi

tmux kill-session chatbot -t 2>/dev/null
git switch "$branch"
tmuxinator start chatbot
