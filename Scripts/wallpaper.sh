#!/bin/bash

# wallpaper="066.jpg"
# wallpaper="067.jpg"
# wallpaper="004.jpg"
# wallpaper="011.jpg"
# wallpaper="049.jpg"
# wallpaper="089.jpg"
# wallpaper="004.jpg"
wallpaper="092.png"

while [[ $# -gt 0 ]]; do
    case $1 in
        -r|--random)
            feh --bg-scale --randomize ~/Pictures/Wallpapers ~/Pictures/Wallpapers/dt-wallpapers ~/Pictures/Wallpapers/mac-wallpapers
            exit 0
            ;;
        -h|--help)
            echo "No help"
            exit 0
            ;;
        -d|--default)
            feh --bg-scale ~/Pictures/Wallpapers/$wallpaper
            exit 0
            ;;
    esac
done

if [ $# -eq 0 ]; then
    echo "No args"
    exit 1
fi
