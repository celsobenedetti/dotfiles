#!/bin/bash

cd "$ZK_NOTEBOOK_DIR" || exit

git checkout main

case "$1" in
f* | -f)
	fd . --type=f -H | fzf | xargs -r nvim
	exit
	;;
esac

zk edit -i

if ! [[ "$1" == "-c" ]]; then
	exit
fi

file=$(git status -s | grep -Eo "[a-zA-Z0-9\-]+\.md")

if [[ $file == "" ]]; then
	exit
fi

git add .
git commit -m "notes backup $(date +"%Y-%m-%d %H:%M:%S")" -q
git push
