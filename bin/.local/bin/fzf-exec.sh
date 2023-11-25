#!/usr/bin/env sh
# AUTHOR: gotbletu (@gmail|twitter|youtube|github|lbry)
#         https://www.youtube.com/user/gotbletu
# DESC:   launch app(s) with fzf like dmenu/rofi
# DEPEND: fzf sed coreutils findutils xdg-utils util-linux

desktop_file() {
	find /usr/share/applications -name "*.desktop" 2>/dev/null &&
		find /usr/local/share/applications -name "*.desktop" 2>/dev/null &&
		find "$HOME/.local/share/applications" -name "*.desktop" 2>/dev/null &&
		find /var/lib/flatpak/exports/share/applications -name "*.desktop" 2>/dev/null &&
		find "$HOME/.local/share/flatpak/exports/share/applications" -name "*.desktop" 2>/dev/null
}

selected="$(desktop_file | sed 's/.desktop//g' | sort | fzf -e -i -m --reverse --delimiter / --with-nth -1)"
[ -z "$selected" ] && exit
cd || return
selected=$(basename "$selected")
# echo "$selected" | while read -r line ; do setsid xdg-open "$line".desktop ; done
echo "$selected" | while read -r line; do setsid gtk-launch "$line".desktop; done
