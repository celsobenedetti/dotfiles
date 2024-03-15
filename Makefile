.PHONY: nvim code vale

nvim:
	-mkdir ~/.config/nvim 2>/dev/null
	stow -v -R -t ~/.config/nvim nvim

code:
	-mkdir ~/.config/Code/User 2>/dev/null
	stow -v -R -t ~/.config/Code/User code

pull:
	git pull
	git submodule update --remote

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

# TODO: try out https://github.com/FiloSottile/age
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


vale:
	stow -D vale -t ~/.config/vale
	stow vale -t ~/.config/vale
	cd ~/.config/vale && vale sync
	-rm ~/.config/vale/styles/write-good/Weasel.yml
	-rm ~/.config/vale/styles/write-good/Passive.yml
	-rm ~/.config/vale/styles/write-good/E-Prime.yml
