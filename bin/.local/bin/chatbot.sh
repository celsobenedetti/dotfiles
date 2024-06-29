#!/bin/bash

cd ~/chatbot/ || exit

desc="Checkout, pull, build and boot up Chatbot:"

echo "Fetching origin..."
git fetch origin

choose_branch() {
	if [ -n "$1" ]; then
		echo "$1"
		return
	fi

	git branch \
		-a \
		--sort=-committerdate |
		fzf \
			--header "$desc" \
			--preview "git diff --color=always {1}" |
		sed 's/remotes.origin.//' |
		tr -d " "
}

branch=$(choose_branch "$1")

if [ -z "$branch" ]; then
	echo "No branch selected"
	exit
fi

# if selected branch is different from the currently checked out
if ! echo "$branch" | grep -q -E "\*"; then
	git switch "$branch"
fi

tmux kill-session -t chatbot 2>/dev/null
tmuxinator start chatbot
