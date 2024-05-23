#!/bin/bash

temp=$(cat /sys/class/thermal/thermal_zone0/temp)
temp_celsius=$((temp/1000))

echo " $temp_celsius°C "
