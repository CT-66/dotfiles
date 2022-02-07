#!/bin/python3
from feedparser import parse
import signal


def main():
    # url = "https://www.archlinux.org/feeds/news"
    url = "https://www.makeuseof.com/feed/category/linux/"
    entries = 1

    for x in parse(url).entries[:entries]:
        print(f"索 {x.title}")
        link = x.link


# exec qutebrowser "link"


def handler(signum):
    if signum == signal.SIGUSR1:
        print("test")


if __name__ == "__main__":
    main()
    while True:
        signal.signal(signal.SIGUSR1, handler)
