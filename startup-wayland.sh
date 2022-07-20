#!/bin/bash

xrdb -merge $HOME/Dotfiles/X11/Xresources && sleep 0.0001
setxkbmap -option caps:escape && sleep 0.0001

# $HOME/Dotfiles/polybar/launch.sh &
# sxhkd &
# deadd-notification-center &
$HOME/Scripts/dotfiles
numlockx &
# pkill greenclip; greenclip daemon &
# kill_program nm-applet; nm-applet &

# wallpaper.sh --default &
wallpaper.sh --random &

mpv --no-video ~/Downloads/windows-xp-startup-sound.wav &
