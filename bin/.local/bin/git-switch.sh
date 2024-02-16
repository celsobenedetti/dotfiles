#!/bin/bash

git branch \
	-a \
	--sort=-committerdate |
	fzf \
		--header "Checkout Recent Branch" \
		--preview "git diff --color=always {1}" |
	sed 's/remotes.origin.//' | #remove remotes/origin/ prefix
	xargs -r \
		git switch
