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

#  Set kernal name
export KERNAL_NAME="$(uname)"

#  Set path to include GNU core utilities if the system is OS X
if [[ "${KERNAL_NAME}" == "Darwin" ]]; then
	export PATH="/usr/local/opt/coreutils/libexec/gnubin:${PATH}"
fi

#  Set path to include ~/.rvm/bin
export PATH="${HOME}/.rvm/bin:${PATH}"

#  Set path to include ~/bin
export PATH="${HOME}/bin:${PATH}"

#  Set gpg terminal to current terminal
export GPG_TTY="$(tty)"

#  Enable recursive file name expansion
shopt -s globstar &> /dev/null

#  Include ~/.bash/aliases if it exists
if [[ -f "${HOME}/.bash/aliases" ]]; then
	source "${HOME}/.bash/aliases"
fi

#  Include ~/.bash/prompt if it exists
if [[ -f "${HOME}/.bash/prompt" ]]; then
	source "${HOME}/.bash/prompt"
fi

#  Include ~/.bash/local if it exists
if [[ -f "${HOME}/.bash/local" ]]; then
	source "${HOME}/.bash/local"
fi

#  Include ~/.rvm/scripts/rvm if it exists
if [[ -f "${HOME}/.rvm/scripts/rvm" ]]; then
	source "${HOME}/.rvm/scripts/rvm"
fi

#  Include ~/.nvm/nvm.sh if it exists
if [[ -f "${HOME}/.nvm/nvm.sh" ]]; then
	source "${HOME}/.nvm/nvm.sh"
fi

#  Set directory colors if ~/.dircolors exists
if [[ -f "${HOME}/.dircolors" ]]; then
	eval "$(dircolors "${HOME}/.dircolors" 2> /dev/null)"
fi
