#!/bin/python3
try:
    from libqtile.command.client import InteractiveCommandClient
    c = InteractiveCommandClient()
    print(c.layout.info().get("name"))
except:
    print("")
