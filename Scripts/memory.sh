#!/bin/bash

memory=$(free -m | sed -n 's/^Mem:\s\+[0-9]\+\s\+\([0-9]\+\)\s.\+/\1/p')

echo "﬙ $memory MB "
