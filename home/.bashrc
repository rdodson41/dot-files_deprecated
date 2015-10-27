#!/bin/bash

#
#  Name:     rdodson41/dot-files/home/.bashrc
#  Author:   Richard E. Dodson <richard.elias.dodson@gmail.com>
#  Created:  Tue Sep 22 20:20:57 UTC 2015
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

#  Include ~/.bash/aliases if it exists
if [[ -f "$HOME/.bash/aliases" ]]; then
	source "$HOME/.bash/aliases"
fi

#  Include ~/.bash/prompt if it exists
if [[ -f "$HOME/.bash/prompt" ]]; then
	source "$HOME/.bash/prompt"
fi

#  Enable implicit cd
shopt -s autocd &> /dev/null

#  Enable recursive file name expansion
shopt -s globstar &> /dev/null

#  Set directory colors to Solarized Dark if dircolors exists
if dircolors --version &> /dev/null; then
	eval "$(dircolors "/usr/local/opt/dircolors-solarized/dircolors.ansi-dark")"
fi
