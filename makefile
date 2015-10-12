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

ROOT =

ETC = etc

OPT = opt
OPT_PROJECT = $(OPT)/rdodson41/dot-files

USR = usr
USR_LOCAL = $(USR)/local

SYNC = $(ETC)
TEMP = $(shell mktemp -d)/

.PHONY: usage
usage:

$(ROOT)/$(USR_LOCAL):
	@mkdir -pv $@

.PHONY: install
install: $(ROOT)/$(USR_LOCAL)
	@cd $< && mkdir -pv $(OPT_PROJECT)
	@rsync -avh --delete $(SYNC) $</$(OPT_PROJECT)

.PHONY: uninstall
uninstall: $(ROOT)/$(USR_LOCAL)
	@rsync -avh --delete $(TEMP) $</$(OPT_PROJECT)
	@cd $< && rmdir -pv $(OPT_PROJECT)