#!/bin/bash

xdotool search --all --screen $DISPLAY --classname polybar windowkill %@
polybar main 2>&1 | tee -a /tmp/polybar1.log & disown
polybar bar2 2>&1 | tee -a /tmp/polybar2.log & disown

echo "Polybar launched..."
