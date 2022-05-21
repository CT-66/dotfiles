#!/bin/bash

if [ -f /usr/bin/setxkbmap ]; then
    setxkbmap -option caps:escape
elif [ -f /usr/bin/xmodmap ]; then
    xmodmap ~/.config/X11/Xmodmap
else
    echo "Error"
fi
