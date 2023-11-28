#!/bin/bash

COMMIT_TYPES=(
	"➕ add"
	"🔧 fix"
	"🚀 feat"
	"📝 docs"
	"🎨 ui"
	"🧩 refactor"
	"🧪 test"
	"🧹 chore"
	"📦 build"
	"📦 make"
	"🤖 ci"
	"✍️ note"
	"🐋 docker"
	"🔀 merge"
	"📦 deps"
	"🗑️ remove"
	"⚡ perf"
	"⚙️ tweak"
	"🐛 fix"
	"🚧 WIP"
	"📁 init"
	"🔒️ security"
	"⚓ deploy"
	"⚙️  config"
	"📔 vim"
	"🖥️ tmux"
)

# pick commit type
TYPE=$(
	for i in "${COMMIT_TYPES[@]}"; do
		echo "$i"
	done | fzf --prompt "Pick Commit Type: "
)

# exit if type is not provided
test -z "$TYPE" && exit 0

# if -e is passed as command line argument, strip emoji
if ! [[ $1 == "-e" ]]; then
	TYPE=$(echo "$TYPE" | awk '{print $2}')
fi

git commit -m "$TYPE:" -e
exit 0

# rm /tmp/commit-message 2>/dev/null
# touch /tmp/commit-message 2>/dev/null
# echo -n "$TYPE$SCOPE:  " >>/tmp/commit-message # write commit template to tmp file
# # open neovim (with cursor at the end of first line, in insert mode) for tmp file
# nvim +1 +"normal $" -c "startinsert" /tmp/commit-message
