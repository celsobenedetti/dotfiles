DIRS = alacritty bin git gtk nvim snippets sway tmux wofi zsh

link:
	stow $(DIRS)

unlink:
	stow -D $(DIRS)

decrypt:
	ansible-vault decrypt git/.gituser-work.crypt --output git/.gituser-work
