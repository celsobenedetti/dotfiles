#!/bin/bash

COMMIT_TYPES="add
build
chore
ci
cleanup
config
deploy
deps
docker
docs
feat
fix
format
init
make
merge
note
perf
refactor
remove
rename
organize
security
test
tmux
tweak
ui
update
vim
wip"

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
