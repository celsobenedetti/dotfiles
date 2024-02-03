#!/bin/bash

zkc(){
    git add .
    git commit -m "🦉 $now - $filename" -q
}

note() {
    zk new -t "$1" ~/Documents/notes/inbox/
}
