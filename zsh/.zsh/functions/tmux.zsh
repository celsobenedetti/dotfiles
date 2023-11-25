#!/bin/bash

# kills all tmux sessions except attached one
tclean() {
    sessions="$(tmux ls | grep -v attached | awk '{print $1}' | tr -d ':')"

    for arg in "$@"; do
        sessions="$(echo "$sessions" | grep -v "$arg")"
    done
    sessions="$(echo "$sessions" | grep -v "notes")"

    printf "Kiling sessions...\n\n"

    echo "$sessions" | while read -r session; do
        echo " $session"
       tmux kill-session -t "$session"
    done
}
