#!/bin/bash

# memory=$(free -m | sed -n 's/^Mem:\s\+[0-9]\+\s\+\([0-9]\+\)\s.\+/\1/p')
memory=$(free -m|awk '/^Mem:/{print $3}')
swap=$(free -m|awk '/^Swap:/{print $3}')
total_memory=$(($memory + $swap))
total_memory_gb=$(echo $total_memory | awk '{printf "%.2f", $1 / 1000}')

# if [ "$swap" -eq 0 ]; then
#     echo "﬙ $total_memory MB "
# elif [ "$swap" -gt 0 ]; then
#     # echo "﬙ $total_memory ($memory + $swap) MB "
#     echo "﬙ $total_memory MB [sw] "
# fi

echo "﬙ $total_memory_gb GB "
