#!/bin/bash

# memory=$(free -m | sed -n 's/^Mem:\s\+[0-9]\+\s\+\([0-9]\+\)\s.\+/\1/p')
memory=$(free -m|awk '/^Mem:/{print $3}')

echo "﬙ $memory MB "
