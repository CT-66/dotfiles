#!/bin/sh

export $(cat ~/Dotfiles/polybar/scripts/.env | xargs)

notifications=$(curl -sf --user-agent "$USERAGENT" "$URL" | jq '.["data"]["children"] | length')

if [ -n "$notifications" ] && [ "$notifications" -gt 0 ]; then
    echo "%{F#ff4500} $notifications"
else
    echo ""
fi
