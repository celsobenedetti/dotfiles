#!/usr/bin/env bash
selected=`cat ~/.local/bin//.tmux-cht-languages ~/.local/bin//.tmux-cht-command | fzf`
if [[ -z $selected ]]; then
    exit 0
fi

read -p "Enter Query: " query

if grep -qs "$selected" ~/.local/bin//.tmux-cht-languages; then
    query=`echo $query | tr ' ' '+'`
    # echo \"curl cht.sh/$selected/$query/\" & curl cht.sh/$selected/$query & while [ : ]; do sleep 1; done
    curl -s cht.sh/$selected/$query | less
else
    curl -s cht.sh/$selected~$query | less
fi

