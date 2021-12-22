#!/bin/bash

$HOME/Dotfiles/polybar/launch.sh &
pkill sxhkd; sxhkd &
#  xrandr --output Virtual1 --mode 1920x1080
# feh --bg-scale ~/Pictures/Wallpapers/065.jpg &
feh --bg-scale ~/Pictures/Wallpapers/066.jpg &
export $(dbus-launch) && dunst &
$HOME/Scripts/dotfiles &
# flashfocus
numlockx &
greenclip daemon &
nm-applet &

# picom-ibhagwan
picom -b &

# picom-jonaburg
# picom -f --experimental-backend -b &
