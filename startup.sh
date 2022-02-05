#!/bin/bash

export XDG_SESSION_TYPE=x11
xrdb -merge $HOME/Dotfiles/X11/Xresources && sleep 0.0001
xmodmap $HOME/Dotfiles/X11/Xmodmap && sleep 0.0001

$HOME/Dotfiles/polybar/launch.sh &
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


# wallpaper="066.jpg"
wallpaper="067.jpg"
# wallpaper="004.jpg"
# wallpaper="011.jpg"
# wallpaper="049.jpg"
feh --bg-scale ~/Pictures/Wallpapers/$wallpaper &

# test
pkill py-trayicon-exa && sleep 2
~/Desktop/py-trayicon-example.py &
