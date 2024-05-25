#!/bin/bash

url="$1"

if echo "$url" | \grep -q "https" > /dev/null; then
    url="$1"
elif [ "$1" = "" ]; then
    echo "ERROR: No url provided"
    exit 1
else
    url="https://$1"
fi

link=$(curl -F "shorten=$url" https://ttm.sh)

echo "Link: $link"

if [ "$XDG_SESSION_TYPE" == "wayland" ]; then
    wl-copy "$link"
else
    echo "$link" | xclip -sel clip
fi
