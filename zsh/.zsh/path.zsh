#!/bin/bash

# local linux installation
export PATH=/home/celso/.cargo/bin:$PATH
export PATH=/home/celso/.dotfiles/scripts/:$PATH
export PATH=/home/celso/.local/bin:$PATH

export PATH=/home/celso/.local/share/nvim/mason/bin:$PATH
export PATH=/home/celso/.local/venv/bin:$PATH
export PATH=/home/celso/.local/share/pnpm/:$PATH

export PATH=/usr/local/go/bin:$PATH
export PATH=$GOPATH/bin:$PATH

export ZK_NOTEBOOK_DIR=/home/celso/Documents/notes
export ZK=$ZK_NOTEBOOK_DIR

export DENO_INSTALL="/home/celso/.deno"
export PATH="$DENO_INSTALL/bin:$PATH"

# protobuf
export PATH="/usr/local/protobuf/bin:$PATH"

# Golang GOPATH
export PATH="/home/celso/go/bin/:$PATH"
