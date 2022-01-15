#!/bin/bash

script="$(\ls $HOME/Scripts | rofi -dmenu -p "Scripts")"
$script
