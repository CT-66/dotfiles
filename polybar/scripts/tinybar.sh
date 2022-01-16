#!/usr/bin/env bash

echo "---" | tee -a /tmp/polybar2.log
polybar tray-bar >> /tmp/polybar2.log 2>&1
