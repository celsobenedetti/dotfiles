#!/usr/bin/env bash
# Display preview of tmux windows/panes.
# Meant for use in fzf preview.
# Kudos:
#   https://stackoverflow.com/a/55247572/197789
#   https://github.com/petobens/dotfiles/blob/master/tmux/tmux_tree

#!/usr/bin/env bash

tmux ls -F'#{session_id}' | while read -r s; do
	S=$(tmux ls -F'#{session_id}#{session_name}: #{T:tree_mode_format}' | grep ^"$s")
	session_info=${S##$s}
	session_name=$(echo "$session_info" | cut -d ':' -f 1)
	if [[ -n "$1" ]] && [[ "$1" == "$session_name" ]]; then
		echo -e "\033[1;34m$session_info\033[0m"
	else
		echo -e "\033[1m$session_info\033[0m"
	fi
	tmux lsw -t"$s" -F'#{window_id}' | while read -r w; do
		W=$(tmux lsw -t"$s" -F'#{window_id}#{T:tree_mode_format}' | grep ^"$w")
		echo "  ﬌ ${W##$w}"
	done
done
