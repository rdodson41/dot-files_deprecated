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

PROJECT = rdodson41/dot-files

ETC = etc
LIST = $(shell find $(ETC) -type f)

USR = /usr
USR_LOCAL = $(USR)/local
USR_LOCAL_LIST = $(patsubst %,$(USR_LOCAL)/%,$(LIST))

USR_LOCAL_OPT = $(USR_LOCAL)/opt
USR_LOCAL_OPT_PROJECT = $(USR_LOCAL_OPT)/$(PROJECT)
USR_LOCAL_OPT_PROJECT_LIST = $(patsubst %,$(USR_LOCAL_OPT_PROJECT)/%,$(LIST))

HOME_LIST = $(patsubst %,$(HOME)/%,$(LIST))

.PHONY: usage
usage:

.PHONY: install
install: $(USR_LOCAL_LIST)

$(USR_LOCAL):
	@mkdir -vp $@

$(USR_LOCAL)/%: $(USR_LOCAL_OPT_PROJECT)/% | $(USR_LOCAL)
	@mkdir -vp $(@D)
	@ln -vir -s $? $@

$(USR_LOCAL_OPT_PROJECT):
	@mkdir -vp $@

$(USR_LOCAL_OPT_PROJECT_LIST): | $(USR_LOCAL_OPT_PROJECT)
	@rsync -vha $(ETC) $(USR_LOCAL_OPT_PROJECT)
