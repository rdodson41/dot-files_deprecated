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

HOME = home

ROOT =
ROOT_HOME = $(ROOT)/$(HOME)
ROOT_HOME_USER = $(ROOT_HOME)/$(USER)

FIND_HOME = $(shell find $(HOME) -maxdepth 1 ! -path $(HOME))
FIND_ROOT_HOME_USER = $(patsubst $(HOME)/%,$(ROOT_HOME_USER)/%,$(FIND_HOME))

.DEFAULT: usage
.PHONY: usage
usage:

.PHONY: install
install: $(FIND_ROOT_HOME_USER)

$(ROOT_HOME_USER)/%: $(HOME)/%
	@ln -frs $? $@

.PHONY: uninstall
uninstall:
	@rm -f $(FIND_ROOT_HOME_USER)
