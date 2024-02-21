#! /bin/sh
#
handle_alacritty() {
	# HACK: wait for alacritty to open
	while ! xdotool search --sync --name "floating" >/dev/null 2>&1; do
		sleep 0.1
	done
	center
	open_note
}

open_note() {
	# also a hack
	xdotool type "note.sh; exit"
	xdotool key Return
}

center() {
	# Get the screen resolution
	screen_width=$(xdpyinfo | awk '/dimensions/{print $2}' | cut -d 'x' -f1)
	screen_height=$(xdpyinfo | awk '/dimensions/{print $2}' | cut -d 'x' -f2)

	# Calculate the position for centering the window
	window_width=900
	window_height=700
	x_pos=$(((screen_width - window_width) / 2))
	y_pos=$(((screen_height - window_height) / 2))

	# Get the focused window
	fw=$(xdotool search --name "floating")

	# Resize and move the window to the calculated position
	xdotool windowsize "$fw" "$window_width" "$window_height"
	xdotool windowmove "$fw" "$x_pos" "$y_pos"
}

handle_alacritty &
# Start Alacritty as a floating window
alacritty -t floating
