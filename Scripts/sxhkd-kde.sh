#!/bin/bash

if [ $XDG_CURRENT_DESKTOP = "KDE" ]; then
    sxhkd -c ~/.config/sxhkd/sxhkdrc-kde
  else
    :
fi

