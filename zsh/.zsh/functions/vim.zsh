#!/bin/bash

vit(){
    file=$1

    if [[ $file ]]; then
        touch $file
        nvim $file
    fi
}
