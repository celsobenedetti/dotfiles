#! /bin/sh

handle_alacritty() {
	# HACK: wait for alacritty to open
	# forgive me father
	sleep 0.16
	center
	open_note
}

open_note() {
	# also a hack
	xdotool type "note.sh"
	xdotool key Return
}

center() {
	# Get the screen resolution
	screen_width=$(xdpyinfo | awk '/dimensions/{print $2}' | cut -d 'x' -f1)
	screen_height=$(xdpyinfo | awk '/dimensions/{print $2}' | cut -d 'x' -f2)

	# Calculate the position for centering the window
	window_width=1920
	window_height=1000
	x_pos=$(((screen_width - window_width) / 2))
	y_pos=$(((screen_height - window_height) / 2))

	# Get the focused window
	fw=$(xdotool getwindowfocus)

	# Resize and move the window to the calculated position
	xdotool windowsize "$fw" "$window_width" "$window_height"
	xdotool windowmove "$fw" "$x_pos" "$y_pos"
}

handle_alacritty &
alacritty -t floating
