#!/bin/bash

## incomplete script
## this does not work yet

USERNAME=$(whoami)

dirs=("$HOME/.config"
    "$HOME/Books"
    "$HOME/Code"
    "$HOME/Desktop"
    "..."
)

str=""
for dir in "${dirs[@]}"; do
    str+=$dir
    str+=" "
done

ranger_dir="$(echo $str | sed "s/\/home\/$USERNAME/\~/" | rofi -dmenu -sep " " -p "")"

st -e "ranger \"$ranger_dir\""
