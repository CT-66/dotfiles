#!/bin/bash

memory=$(free -h|awk '/^Mem:/{print $3}' | sed 's/Gi//g')
swap=$(free -h|awk '/^Swap:/{print $3}' | sed 's/Gi//g')

# if awk -v swap="$swap" 'BEGIN { exit !(swap = 0) }'; then
#     echo "﬙ $memory GB "
# elif awk -v swap="$swap" 'BEGIN { exit !(swap > 0) }'; then
#     echo "﬙ $memory + $swap GB "
# fi

echo "﬙ $memory GB "
