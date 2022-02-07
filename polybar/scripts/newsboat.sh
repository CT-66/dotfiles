#!/bin/bash

# incomplete script

if pgrep -x "newsboat" > /dev/null; then
    echo "索 0"
else
    echo "索 Loading..."
    newsboat -x reload 2>/dev/null
    echo "索 $(newsboat -x print-unread | awk '{print $1}') unread"
fi
