#!/bin/bash

while :
do

    free_with_shared=$(free -m|awk '/^Mem:/{print $7}')
    shared=$(free -m|awk '/^Mem:/{print $5}')
    free=$(($free_with_shared - $shared))

    if [ "$free" -lt 2000 ] && [ "$free" -gt 1000 ]
    then
        notify-send "Low Memory" "Memory is running out!" -u CRITICAL
    elif [ "$free" -lt 1000 ]
    then
        notify-send "CRITICAL: Low Memory" "Less than 1GB RAM available! Close resource heavy applications to prevent OOM." -u CRITICAL
    fi

    sleep 5

done
