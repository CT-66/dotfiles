#!/bin/bash
if pgrep -x "stalonetray" > /dev/null; then
    pkill stalonetray
else
    stalonetray
fi
