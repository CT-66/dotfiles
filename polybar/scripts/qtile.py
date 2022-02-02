#!/bin/python3
from libqtile.command.client import InteractiveCommandClient
from libqtile.lazy import lazy
import sys

c = InteractiveCommandClient()
args = sys.argv

if len(args) > 1:
    arg = args[1]
else:
    arg = ""

try:
    print(c.layout.info().get("name"))
except:
    print("")

if arg == "next":
    lazy.next_layout()
elif arg == "prev":
    lazy.prev_layout()
else:
    pass
