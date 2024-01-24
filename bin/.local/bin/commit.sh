#!/bin/bash

COMMIT_TYPES="add
fix
feat
docs
update
ui
refactor
test
chore
build
make
ci
note
docker
merge
deps
remove
perf
tweak
fix
WIP
init
security
deploy
config
vim
tmux"

# pick commit type
TYPE=$(
	for i in $COMMIT_TYPES; do
		echo "$i"
	done | fzf --prompt "Pick Commit Type: "
)

# exit if type is not provided
test -z "$TYPE" && exit 0

git commit -m "$TYPE:" -e
exit 0
