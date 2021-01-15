NAME=pypi-simple-search
VERSION=0.0.1

DIRS=bin
INSTALL_FILES=`find $(DIRS) -type f 2>/dev/null`

PREFIX?=/usr/local

install:
	for file in $(INSTALL_FILES); do cp $$file $(PREFIX)/$$file; done

uninstall:
	for file in $(INSTALL_FILES); do rm -f $(PREFIX)/$$file; done

.PHONY: install uninstall
