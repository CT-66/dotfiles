#!/bin/bash

cpu=$(mpstat 1 1 | awk '$13 ~ /[0-9.]+/ {print 100 - $13"%"}')

echo " CPU $cpu "
