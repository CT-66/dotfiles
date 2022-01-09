#!/bin/sh

if ! updates_arch=$(checkupdates 2> /dev/null | wc -l ); then
    updates_arch=0
fi

#if ! updates_aur=$(yay -Qum 2> /dev/null | wc -l); then
if ! updates_aur=$(paru -Qum 2> /dev/null | wc -l); then
    updates_aur=0
fi

updates=$((updates_arch + updates_aur))

if [ "$updates" -gt 1 ]; then
    echo "%{F#98C379} $updates updates"
elif [ "$updates" -eq 1 ]; then
    echo "%{F#98C379} $updates update"
else
    echo ""
fi
