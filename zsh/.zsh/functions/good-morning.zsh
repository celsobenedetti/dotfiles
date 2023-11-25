#!/bin/bash

lazy (){
    echo "lazy.nvim: Updating and syncing neovim plugins..."
    nvim --headless "+Lazy! sync" +qa
    echo "lazy.nvim: Sync done!"
}

morning () {
    current_dir=$(pwd)
    cd ~/Documents/notes/ || exit
    echo "Updating notes..."
    git pull
    echo "Updating dotfiles..."
    cd ~/.dotfiles/ || exit
    git restore nvim/.config/nvim/lazy-lock.json # annoying to deal with
    git pull
    lazy
    cd "$current_dir" || exit
}
