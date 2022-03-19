#!/bin/bash

url="$1"

if echo "$url" | \grep -q "https" > /dev/null; then
    url="$1"
elif [ "$1" = "" ]; then
    echo "ERROR: No file provided"
    exit 1
else
    url="https://$1"
fi

link=$(curl -F "shorten=$url" https://ttm.sh)

echo "Link: $link"
echo $link | xclip -sel clip
