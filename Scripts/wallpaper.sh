#!/bin/bash

# wallpaper="066.jpg"
# wallpaper="067.jpg"
# wallpaper="004.jpg"
# wallpaper="011.jpg"
# wallpaper="049.jpg"
# wallpaper="089.jpg"
# wallpaper="004.jpg"
# wallpaper="095.jpg"
# wallpaper="092.png"
wallpaper="112.png"

while [[ $# -gt 0 ]]; do
    case $1 in
        -r|--random)
            feh --bg-scale --randomize ~/Pictures/Wallpapers ~/Pictures/Wallpapers/dt-wallpapers ~/Pictures/Wallpapers/mac-wallpapers ~/Pictures/Wallpapers/kurzgesagt
            exit 0
            ;;
        -h|--help)
            echo "~~RTFM~~ Read The Fucking Script"
            exit 0
            ;;
        -d|--default)
            feh --bg-scale ~/Pictures/Wallpapers/$wallpaper
            exit 0
            ;;
        -c|--current-wallpaper)
            if [ -f "$HOME/.fehbg" ]; then
                current_wallpaper="$(awk '{print $4}' ~/.fehbg)"
                notify-send "wallpaper.sh" "Current wallpaper: $current_wallpaper"
                echo "$current_wallpaper" | xclip -sel clip
                exit 0
            elif [ ! -f "HOME/.fehbg" ]; then
                notify-send "wallpaper.sh" "Error"
                exit 1
            fi
            ;;

    esac
done

if [ $# -eq 0 ]; then
    echo "No args"
    exit 1
fi
