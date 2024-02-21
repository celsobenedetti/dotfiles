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

if [ -z "$branch" ]; then
	echo "No branch selected"
	exit
fi

# selected branch is different from the currently checked out
if ! echo "$branch" | grep -q -E "\*"; then
	git switch "$branch"
fi

tmux kill-session -t chatbot 2>/dev/null
tmuxinator start chatbot
