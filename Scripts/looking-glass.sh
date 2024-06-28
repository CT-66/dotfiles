#!/bin/bash
pkill xremap
looking-glass-client -s -F -S -m "KEY_RIGHTCTRL"
xremap --watch /home/arch/.config/xremap/config.yml && echo "Wait!\n" && sleep 3 && echo "Done" & disown
