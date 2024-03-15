#!/bin/bash


git branch \
	-a \
	--sort=-committerdate |
	fzf --prompt "$FZF_PROMPT file -> " \
	--preview "git diff {1} --color=always" \
	--height=80% |
	sed 's/remotes.origin.//' | #remove remotes/origin/ prefix
	xargs -r \
		git switch

