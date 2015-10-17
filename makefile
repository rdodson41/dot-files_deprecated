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

home = /home
opt = /opt
usr = /usr
usr_local = $(usr)/local

root = 
root_home = $(HOME)
root_home_vim = $(root_home)/.vim

pwd = $(shell pwd)

solarized = /solarized
solarized_vim_colors_solarized = $(solarized)/vim-colors-solarized

colors = /colors
colors_solarized = $(colors)/solarized.vim

find_pwd_home = $(shell find $(pwd)$(home) ! -type d)
find_root_home = $(patsubst $(pwd)$(home)/%,$(root_home)/%,$(find_pwd_home)) $(root_home_vim)$(colors_solarized)

.PHONY: help usage
help usage:
	@>&2 echo "make: usage: make [ install | uninstall ]"

.PHONY: install
install: $(find_root_home)

$(root_home)/%: $(pwd)$(home)/%
	@ln -fs $? $@

$(root_home_vim)/%: $(root)$(usr_local)$(opt)$(solarized_vim_colors_solarized)/%
	@mkdir -p $(@D)
	@ln -fs $? $@

.PHONY: uninstall
uninstall:
	@rm -f $(find_root_home)
