CFLAGS=-O2 -Wall -Wextra -lX11 -lpci
PREFIX=$(HOME)/.local
CACHE=$(shell if [ "$$XDG_CACHE_HOME" ]; then echo "$$XDG_CACHE_HOME"; else echo "$$HOME"/.cache; fi)

all: paleofetch2

clean:
	rm -f paleofetch2 $(CACHE)/paleofetch2

paleofetch: paleofetch.c paleofetch.h config.h
	$(eval battery_path := $(shell ./config_scripts/battery_config.sh))
	$(CC) paleofetch.c -o paleofetch2 $(CFLAGS) -D $(battery_path)
	strip paleofetch2

install: paleofetch
	mkdir -p $(PREFIX)/bin
	install ./paleofetch2 $(PREFIX)/bin/paleofetch2

uninstall: paleofetch
	rm $(PREFIX)/bin/paleofetch2
