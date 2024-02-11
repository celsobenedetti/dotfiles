#!/bin/bash

book=$(fd . ~/Documents/books | sed "s/ /\\ /g" | fzf)

echo "$book" | xargs -r -d "\n" evince
