#!/bin/bash

#
#  Name:     rdodson41/dot-files/home/.bashrc
#  Author:   Richard E. Dodson <richard.elias.dodson@gmail.com>
#  Created:  Tue Sep 22 20:20:57 UTC 2015
#  License:  GNU General Public License, Version 3, 29 June 2007
#
#  Copyright (C) 2015, 2016 Richard E. Dodson <richard.elias.dodson@gmail.com>
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

#  Set local software directory
if [[ "${KERNAL_NAME}" == "Darwin" ]] && which brew &> /dev/null; then
  export USR_LOCAL="$(brew --prefix)"
else
  export USR_LOCAL="/usr/local"
fi

#  Set path to include GNU core utilities if they exist
if [[ "${KERNAL_NAME}" == "Darwin" && -d "${USR_LOCAL}/opt/coreutils/libexec/gnubin" ]]; then
  export PATH="${USR_LOCAL}/opt/coreutils/libexec/gnubin:${PATH}"
fi

#  Set manual path to include GNU core utilities if they exist
if [[ "${KERNAL_NAME}" == "Darwin" && -d "${USR_LOCAL}/opt/coreutils/libexec/gnuman" ]]; then
  if [[ -n "${MANPATH}" ]]; then
    export MANPATH="${USR_LOCAL}/opt/coreutils/libexec/gnuman:${MANPATH}"
  else
    export MANPATH="${USR_LOCAL}/opt/coreutils/libexec/gnuman"
  fi
fi

#  Set path to include ~/.rvm/bin if it exists
if [[ -d "${HOME}/.rvm/bin" ]]; then
  export PATH="${HOME}/.rvm/bin:${PATH}"
fi

#  Set path to include ~/bin if it exists
if [[ -d "${HOME}/bin" ]]; then
  export PATH="${HOME}/bin:${PATH}"
fi

#  Set NVM directory to ~/.nvm if it exists
if [[ -d "${HOME}/.nvm" ]]; then
  export NVM_DIR="${HOME}/.nvm"
fi

#  Set GPG terminal to current terminal
export GPG_TTY="$(tty)"

#  Enable recursive file path expansion
shopt -s globstar &> /dev/null

#  Include /usr/local/etc/bash_completion if it exists
if [[ -f "${USR_LOCAL}/etc/bash_completion" ]]; then
  source "${USR_LOCAL}/etc/bash_completion"
fi

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

#  Include ~/.nvm/nvm.sh if it exists
if [[ -f "${HOME}/.nvm/nvm.sh" ]]; then
  source "${HOME}/.nvm/nvm.sh"
fi

#  Include ~/.rvm/scripts/rvm if it exists
if [[ -f "${HOME}/.rvm/scripts/rvm" ]]; then
  source "${HOME}/.rvm/scripts/rvm"
fi

#  Include ~/.gpg-agent-info if it exists
if [[ -f "${HOME}/.gpg-agent-info" ]]; then
  source "${HOME}/.gpg-agent-info"
fi

#  Set directory colors if ~/.dircolors exists
if [[ -f "${HOME}/.dircolors" ]]; then
  eval "$(dircolors "${HOME}/.dircolors" 2> /dev/null)"
fi

#  Invoke gpg-agent if it has not already been invoked
if [[ -S "${GPG_AGENT_INFO%%:*}" ]]; then
  export GPG_AGENT_INFO
else
  eval "$(gpg-agent --daemon --write-env-file 2> /dev/null)"
fi
