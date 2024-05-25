#!/bin/bash

file="$1"

if [ "$file" = "" ]; then
    echo "ERROR: No file provided"
    exit 1
fi

site=$(echo '0x0.st
ttm.sh
anonfiles.com' | fzf
)

case $site in
    "0x0.st")
        url="https://0x0.st"
        ;;
    "ttm.sh")
        url="https://ttm.sh"
        ;;
    "anonfiles.com")
        url="https://api.anonfiles.com/upload"
        ;;
    *)
        echo "Error"
        return 1
esac

link=$(curl -F "file=@$file" $url)

copy() {
    if [ $XDG_SESSION_TYPE == "wayland" ]; then
        wl-copy "$1"
    else
        echo "$1" | xclip -sel clip
    fi
}

echo "Link: $link"
copy "$link"

read -p "Shorten URL? " prompt
case $prompt in
    "y"|"yes")
        shortened_link=$(curl -F "shorten=$link" https://ttm.sh)
        echo "Shortened URL: $shortened_link"
        copy "$shortened_link"
        ;;
    "n"|"no")
        :
        ;;
    *)
        echo "ERROR: Invalid input"
        return 1
        ;;
esac
