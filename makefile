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

#  Set shell
SHELL = bash -o pipefail

#  Set absolute file paths
root = 
root_home = $(HOME)
root_home_vim = $(root_home)/.vim
root_pwd = $(PWD)

#  Set relative file paths
home = /home
opt = /opt
usr = /usr
usr_local = $(usr)/local

#  Set relative file paths - Solarized
solarized = /solarized
solarized_vim_colors_solarized = $(solarized)/vim-colors-solarized

#  Set relative file paths - vim colors
colors = /colors
colors_solarized = $(colors)/solarized.vim

#  Log usage
.PHONY: help usage
help usage:
	@echo "make: usage: make [ help | pull | install | uninstall | update ]" >&2
	@echo "$(SHELL)"

#  Pull repository
.PHONY: pull
pull:
	@echo "make: Pull repository" >&2
	@git pull --verbose 2>&1 | sed -e "s/^/make: git: /" >&2

#  Install repository
.PHONY: install
install: $(patsubst $(root_pwd)$(home)/%,$(root_home)/%,$(shell find $(root_pwd)$(home) ! -type d)) $(root_home_vim)$(colors_solarized)

$(root_home)/%: $(root_pwd)$(home)/%
	@mkdir -p $(@D) 2>&1 | sed -e "s/^/make: /" >&2
	@echo "make: Create symbolic link: $? to $@" >&2
	@ln -s $? $@ 2>&1 | sed -e "s/^/make: /" >&2

$(root_home_vim)/%: $(root)$(usr_local)$(opt)$(solarized_vim_colors_solarized)/%
	@mkdir -p $(@D)
	@echo "make: Create symbolic link: $? to $@" >&2
	@ln -s $? $@

#  Uninstall repository
.PHONY: uninstall
uninstall:
	@rm -f $(patsubst $(root_pwd)$(home)/%,$(root_home)/%,$(shell find $(root_pwd)$(home) ! -type d)) $(root_home_vim)$(colors_solarized)

#  Update repository
.PHONY: update
update: uninstall pull install
