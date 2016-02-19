#!/usr/bin/make -f

#
#  Name:     rdodson41/dot-files/makefile
#  Author:   Richard E. Dodson <richard.elias.dodson@gmail.com>
#  Created:  Wed Oct 07 00:22:50 UTC 2015
#  License:  GNU General Public License, Version 3, 29 June 2007
#
#  Copyright (C) 2015 Richard E. Dodson <richard.elias.dodson@gmail.com>
#
#  This file is part of dot-files.
#
#  dot-files is free software: you can redistribute it and/or modify
#  it under the terms of the GNU General Public License as published by
#  the Free Software Foundation, either version 3 of the License, or
#  (at your option) any later version.
#
#  dot-files is distributed in the hope that it will be useful,
#  but WITHOUT ANY WARRANTY; without even the implied warranty of
#  MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the
#  GNU General Public License for more details.
#
#  You should have received a copy of the GNU General Public License
#  along with dot-files. If not, see <http://www.gnu.org/licenses/>.
#

#  Set shell to bash
SHELL = bash -o pipefail

#  Set version to most recent git tag
version = $(shell git describe)

#  Set absolute directories
root =

#  Set build targets
home = home
home-all = $(shell find "$(home)" ! -type d)

#  Set install targets
root-home = $(HOME)
root-home-all = $(patsubst $(home)/%,$(root-home)/%,$(home-all))
install-all = $(root-home-all)

#  Print usage to standard error
.PHONY: help usage
help usage:
	@echo "make: usage: make [ help | version | pull | push | install | uninstall ]" >&2

#  Print version to standard error
.PHONY: version
version:
	@echo "make: version: $(version)" >&2

#  Pull repository
.PHONY: pull
pull:
	@git pull --verbose 2>&1 | sed -e "s/^/make: git: /" >&2

#  Push repository
.PHONY: push
push:
	@git push --verbose 2>&1 | sed -e "s/^/make: git: /" >&2

#  Install targets
.PHONY: install
install: $(install-all)

$(root-home)/%: $(home)/%
	@echo "make: rsync: $(home) -> $(root-home)" >&2
	@rsync --verbose --archive --human-readable "$(home)/" "$(root-home)" 2>&1 | sed -e "s/^/make: rsync: /" >&2

#  Uninstall targets
.PHONY: uninstall
uninstall:
	@echo "make: rm: $(install-all)" >&2
	@rm -f $(install-all) 2>&1 | sed -e "s/^/make: /" >&2
