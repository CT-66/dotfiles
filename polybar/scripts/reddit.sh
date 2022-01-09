#!/bin/sh

export $(cat ~/Dotfiles/polybar/scripts/.env | xargs)
# export URL="https://www.reddit.com/message/unread/.json?...feed=&user=..."
# export USERAGENT="polybar-scripts/notification-reddit:v1.0-u/..."

notifications=$(curl -sf --user-agent "$USERAGENT" "$URL" | jq '.["data"]["children"] | length')

if [ -n "$notifications" ] && [ "$notifications" -gt 1 ]; then
    echo "%{F#E06C75} $notifications notifications"
elif [ -n "$notifications" ] && [ "$notifications" -eq 1 ]; then
    echo "%{F#E06C75} $notifications notification"
else
    echo ""
fi
