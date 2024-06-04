#!/bin/bash

while :
do
    if ! updates_arch=$(checkupdates 2> /dev/null | wc -l ); then
        updates_arch=0
    fi

    if ! updates_aur=$(yay -Qum 2> /dev/null | wc -l); then
        updates_aur=0
    fi

    updates=$((updates_arch + updates_aur))

    if [ "$updates" -gt 1 ] || [ "$updates" -eq 1 ]
    then
        notify-send "System updates" "$updates updates are available\nPacman: $updates_arch, AUR: $updates_aur"
    else
        :
    fi

    sleep 6h

done
