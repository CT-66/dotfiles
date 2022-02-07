#!/bin/bash
if pgrep -x "newsboat" > /dev/null; then
    echo ""
else
    newsboat -x reload
    newsboat -x print-unread | awk '{print $1}'
fi
