#!/bin/bash

if ! [[ "$(docker images | rg lazyvim)" ]]; then
	docker build -t lazyvim ~/.dotfiles/nvim
fi

docker run -it \
	-w /app \
	-v "$(pwd):/app" \
	-v "lazyvim:/root/.local/share/nvim" \
	lazyvim
