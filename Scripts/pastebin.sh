#!/bin/bash

if [ "$1" = "" ]; then
    echo "ERROR: No paste url provided"
    exit 1
fi

link=$1
url="https://pastebin.com/raw"
paste_dir="$HOME/Downloads/pastes"
currentdate=$(date +\"%d-%b-%Y_%I-%M-%S-%p\" | sed "s/\"//g")
output="$paste_dir/paste-$currentdate"


function get_paste() {
    # -P: file directory
    # -O: output format
    curl -o "$output" "$url/$link"
    printf "\n"
    echo "Paste cloned successfully"
    printf "\n"

    open_paste
}

function open_paste() {
    read -p "Do you want to open the paste? " edit_prompt
    if [ "$edit_prompt" = "y" ]; then
        # exec $EDITOR "$output"
        if [ -f "$paste_dir/paste-$currentdate" ]; then
            exec $EDITOR "$paste_dir/paste-$currentdate" & disown
        elif [ -f "/tmp/paste-$currentdate" ]; then
            exec $EDITOR "/tmp/paste-$currentdate" & disown
        else
            echo "Error"
            exit 1
        fi
    elif [ "$edit_prompt" = "n" ]; then
        exit 0
    else
        echo "Invalid input"
        exit 1
    fi
}

function main() {
    if [ ! -d "$paste_dir" ]; then
        read -p "'$paste_dir' doesn't exist. Do you want to create it? " prompt
        if [ "$prompt" = "y" ]; then
            mkdir -p "$paste_dir"
            echo "Directory created"

        elif [ "$prompt" = "n" ]; then
            read -p "Do you want to clone it temporarily to '/tmp'? " prompt2
            if [ "$prompt2" = "y" ]; then
                curl -o "/tmp/paste-$currentdate" "$url/$link"
                printf "\n"
                echo "Paste cloned successfully to '/tmp/paste-$currentdate'"
                printf "\n"
                open_paste
                exit 0
            elif [ "$prompt2" = "n" ]; then
                echo "Exiting script"
                exit 1
            else
                echo "Invalid input"
                exit 1
            fi

        else
            echo "Invalid input, exiting script"
            exit 1
        fi
    fi

    get_paste
}

main
