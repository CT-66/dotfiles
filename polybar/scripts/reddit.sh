#!/bin/sh

export $(cat ~/Dotfiles/polybar/scripts/.env | xargs)
# export URL="https://www.reddit.com/message/unread/.json?...feed=&user=..."
# export USERAGENT="polybar-scripts/notification-reddit:v1.0-u/..."

notifications=$(curl -sf --user-agent "$USERAGENT" "$URL" | jq '.["data"]["children"] | length')

if [ -n "$notifications" ] && [ "$notifications" -gt 0 ]; then
    # echo "%{F#ff4500} $notifications"
    echo "%{F#E06C75} $notifications"
else
    echo ""
fi
