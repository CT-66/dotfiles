#!/bin/bash

export XDG_SESSION_TYPE=x11
xrdb -merge $HOME/Dotfiles/X11/Xresources && sleep 0.0001
xmodmap $HOME/Dotfiles/X11/Xmodmap && sleep 0.0001

$HOME/Dotfiles/polybar/launch.sh &
polybar-msg cmd hide &
sxhkd &
#  xrandr --output Virtual1 --mode 1920x1080
# export $(dbus-launch) && dunst &
# dunst &
deadd-notification-center &
$HOME/Scripts/dotfiles
numlockx &
pkill greenclip; greenclip daemon &
pkill nm-applet; nm-applet &

# picom-ibhagwan
pkill picom; picom -b &

# picom-jonaburg
# pkill picom; picom -f --experimental-backend -b &
pkill flashfocus; flashfocus &


# wallpaper.sh --default &
wallpaper.sh --random &

# test
pkill py-trayicon-exa && sleep 2
~/Desktop/py-trayicon-example.py &
