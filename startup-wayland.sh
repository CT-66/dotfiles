#!/bin/bash

export XDG_SESSION_TYPE=wayland
xrdb -merge $HOME/Dotfiles/X11/Xresources && sleep 0.0001
setxkbmap -option caps:escape && sleep 0.0001

# $HOME/Dotfiles/polybar/launch.sh &
# sxhkd &
# deadd-notification-center &
$HOME/Scripts/dotfiles
numlockx &
# pkill greenclip; greenclip daemon &
# kill_program nm-applet; nm-applet &

# wallpaper-wayland.sh --default &
wallpaper-wayland.sh --random &
