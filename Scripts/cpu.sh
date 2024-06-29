#!/bin/bash

# cpu=$(mpstat 1 1 | awk '$13 ~ /[0-9.]+/ {print 100 - $13"%"}')
cpu=$(mpstat 1 1 | awk '$13 ~ /[0-9.]+/ {usage = 100 - $13; if (usage == int(usage)) printf "%.2f%%\n", usage; else printf "%.2f%%\n", usage}')

echo " $cpu "
