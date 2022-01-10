#!/bin/bash

$HOME/Dotfiles/polybar/launch.sh &
pkill sxhkd; sxhkd &
#  xrandr --output Virtual1 --mode 1920x1080
# feh --bg-scale ~/Pictures/Wallpapers/066.jpg &
# feh --bg-scale ~/Pictures/Wallpapers/067.jpg &
# feh --bg-scale ~/Pictures/Wallpapers/004.jpg &
# feh --bg-scale ~/Pictures/Wallpapers/011.jpg &
# feh --bg-scale ~/Pictures/Wallpapers/011.jpg &
feh --bg-scale ~/Pictures/Wallpapers/067.jpg &
# feh --bg-scale ~/Pictures/Wallpapers/049.jpg &
export $(dbus-launch) && dunst &
$HOME/Scripts/dotfiles 
numlockx &
pkill greenclip; greenclip daemon &
pkill nm-applet; nm-applet &

# picom-ibhagwan
pkill picom; picom -b &

# picom-jonaburg
# pkill picom; picom -f --experimental-backend -b &
pkill flashfocus; flashfocus &



