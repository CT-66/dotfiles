#!/bin/bash

function kill_program () {
    xdotool search --all --screen $DISPLAY --classname $1 windowkill %@
}

export XDG_SESSION_TYPE=x11
xrdb -merge $HOME/Dotfiles/X11/Xresources && sleep 0.0001
# xmodmap $HOME/Dotfiles/X11/Xmodmap && sleep 0.0001
setxkbmap -option caps:escape && sleep 0.0001

$HOME/Dotfiles/polybar/launch.sh &
sxhkd &
#  xrandr --output Virtual1 --mode 1920x1080
export $(dbus-launch) && dunst &
dunst &
numlockx &
pkill greenclip; greenclip daemon &
kill_program nm-applet; nm-applet &

# picom-ibhagwan
kill_program picom; picom -b &

# picom-jonaburg
# kill_program picom; picom -f --experimental-backend -b &
kill_program flashfocus; flashfocus &

# wallpaper.sh --default &
wallpaper.sh --random &

ksnip &
warpd &
