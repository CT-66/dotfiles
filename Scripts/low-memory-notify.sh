#!/bin/bash

while :
do

    free_without_swap=$(free -m|awk '/^Mem:/{print $7}')
    # shared=$(free -m|awk '/^Mem:/{print $5}')
    swap_free=$(free -m|awk '/^Swap:/{print $4}')
    free=$(($free_without_swap + $swap_free))

    if [ "$free" -lt 1500 ] && [ "$free" -gt 1000 ]
    then
        notify-send "Low Memory" "Memory is running out!" -u CRITICAL -h string:x-canonical-private-synchronous:low-memory-notify-sh
    elif [ "$free" -lt 1000 ]
    then
        notify-send "CRITICAL: Low Memory" "Less than 1GB RAM available! Close resource heavy applications to prevent OOM." -u CRITICAL -h string:x-canonical-private-synchronous:low-memory-notify-sh
    fi

    sleep 5

done
