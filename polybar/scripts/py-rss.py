#!/bin/python3 -u
from feedparser import parse
import signal
from os import system
from random import choice
import time

# from sys import stdout

urls = [
    "https://www.makeuseof.com/feed/category/linux/",
    "https://linuxhint.com/feed/",
    "https://linuxize.com/index.xml",
    "https://itsfoss.com/feed/",
    "https://www.fossmint.com/feed/",
    "https://dev.to/feed/tag/linux",
    "https://dev.to/feed/tag/archlinux",
]


def main():
    url = choice(urls)
    entries = 1

    for x in parse(url).entries[:entries]:
        global title
        global link
        title = x.title
        link = x.link
        print(f"索 {title}")


def handler(signum, frame):
    if signum == signal.SIGUSR1:
        system(f'qutebrowser "{link}"')
    # change feed
    # elif signum == signal.SIGUSR2:
    #     main()


if __name__ == "__main__":
    try:
        main()
        while True:
            print(f"\n索 {title}", end="")
            # stdout.flush()
            # time.sleep(1)
            signal.signal(signal.SIGUSR1, handler)
            # signal.signal(signal.SIGUSR2, handler)
    except:
        print("索 Error")
