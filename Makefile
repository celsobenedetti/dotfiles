DIRS = alacritty bin git gtk nvim sway tmux wofi zsh

bin: build
tools: build
build:
	@echo "========= Building Tools =============" 
	@$(MAKE) -s -C tools
	@echo "======================================" 

test:
	@echo "========= Testing Tools =============" 
	@$(MAKE) test -s -C tools 
	@echo "======================================" 

link: stow
stow:
	stow $(DIRS)

unlink: stowd
stowd:
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


