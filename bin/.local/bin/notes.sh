#!/bin/bash

cd "$ZK_NOTEBOOK_DIR" || exit

git checkout main

if [[ "$1" == "-f" ]]; then
	fd . --type=f -H | fzf | xargs -r nvim
	exit
fi

zk edit -i

if ! [[ "$1" == "-c" ]]; then
	exit
fi

file=$(git status -s | grep -Eo "[a-zA-Z0-9\-]+\.md")

if [[ $file == "" ]]; then
	exit
fi

filename=$(tr ".md" " " <<<"$file")

now=$(date +%Y-%m-%d)

git add .
git commit -m "🦉 $now - $filename" -q
git push
