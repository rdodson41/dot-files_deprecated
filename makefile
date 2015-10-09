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

UNAME = $(shell uname)
ifeq ($(UNAME),Darwin)
	OS = mac-os-x
else
	OS = default
endif

PROJECT_NAME = rdodson41/dot-files

ETC = etc
OPT = opt

USR_LOCAL = /usr/local
USR_LOCAL_OPT = $(USR_LOCAL)/$(OPT)

INSTALL = $(USR_LOCAL_OPT)

LINK_LIST = $(HOME)/.bashrc $(HOME)/.bash_profile $(HOME)/.bash_aliases $(HOME)/.gitconfig $(HOME)/.vimrc
UNLINK_LIST = $(patsubst %,unlink/%,$(LINK_LIST))

.PHONY: usage
usage:

.PHONY: install
install:
	@cd $(INSTALL) && mkdir -p $(PROJECT_NAME)
	@rsync -avh $(ETC) $(INSTALL)/$(PROJECT_NAME)

.PHONY: uninstall
uninstall:
	@rsync -avh --delete `mktemp -d`/ $(INSTALL)/$(PROJECT_NAME)
	@cd $(INSTALL) && rmdir -p $(PROJECT_NAME)

.PHONY: link
link: $(LINK_LIST)
	
$(HOME)/%: $(INSTALL)/$(PROJECT_NAME)/$(ETC)/*/%
	@ln -vi -s $? $@

$(HOME)/%: $(INSTALL)/$(PROJECT_NAME)/$(ETC)/*/$(OS)/%
	@ln -vi -s $? $@

.PHONY: unlink
unlink: $(UNLINK_LIST)

.PHONY: unlink/%
unlink/%:
	@rm -f $*
