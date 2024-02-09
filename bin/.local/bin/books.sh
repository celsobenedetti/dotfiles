#!/bin/bash

fd . ~/Documents/books | sed "s/ /\\ /g" | fzf | xargs -r -d "\n" evince
