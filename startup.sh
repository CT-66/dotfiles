#!/bin/bash

$HOME/Dotfiles/polybar/launch.sh &
pkill sxhkd; sxhkd &
#  xrandr --output Virtual1 --mode 1920x1080
feh --bg-scale ~/Pictures/Wallpapers/065.jpg &
export $(dbus-launch) && dunst &
$HOME/Scripts/dotfiles &
# picom -b &
picom -f --experimental-backend -b &
# flashfocus
numlockx &
greenclip daemon &
