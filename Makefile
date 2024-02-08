DIRS = alacritty bin git gtk nvim sway tmux wofi zsh

link:
	stow $(DIRS)

unlink:
	stow -D $(DIRS)

encrypt:
	@find git -type f | grep -v crypt | \
		while read -r file; do \
			ansible-vault encrypt $$file --output $$file.crypt --vault-password-file ~/.vault; \
		done

decrypt:
	@find git -type f | grep crypt | \
		while read -r file; do \
			output=$$(echo $$file | sed 's/\.crypt$$//'); \
			ansible-vault decrypt $$file --output $$output --vault-password-file ~/.vault; \
		done
	@stow git

build:
	$(MAKE) -C tools
