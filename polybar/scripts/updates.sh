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
    echo "%{F#BF616A} $updates"
elif [ "$updates" -eq 1 ]; then
    echo "%{F#BF616A} $updates"
else
    echo "%{F#BF616A} 0"
fi

#BF616A
