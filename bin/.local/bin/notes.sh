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

git pull
git add .
git commit -m "notes backup $(date +"%Y-%m-%d %H:%M:%S")" -q
git push
