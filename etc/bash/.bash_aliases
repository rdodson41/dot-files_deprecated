#!/bin/bash

#
#  Name:     rdodson41/dot-files/etc/bash/.bash_profile
#  Author:   Richard E. Dodson <richard.elias.dodson@gmail.com>
#  Created:  Sun Oct 11 17:18:18 UTC 2015
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
KERNAL_NAME=$(uname)

#  Set ls to:
#    -F, --classify               indicate file type
#    -G, --color=auto             colorize output if standard output is connected to a terminal
#    -T, --time-style=long-iso    show long-iso time values
#    -h, --human-readable         show human-readable size values
case "$KERNAL_NAME" in
Darwin)
	alias ls="ls -FGTh"
	;;
Linux)
	alias ls="ls --classify --human-readable --time-style=long-iso --color=auto"
	;;
esac

#  Alias ls
alias l="ls"
alias la="ls -A"
alias lal="ls -Al"
alias lalr="ls -ARl"
alias lar="ls -AR"
alias larl="ls -ARl"
alias ll="ls -l"
alias lla="ls -Al"
alias llar="ls -ARl"
alias llr="ls -Rl"
alias llra="ls -ARl"
alias lr="ls -R"
alias lra="ls -AR"
alias lral="ls -ARl"
alias lrl="ls -Rl"
alias lrla="ls -Arl"

#  Set grep, egrep, fgrep, and rgrep to:
#        --color=auto             colorize output if standard output is connected to a terminal
alias grep="grep --color=auto"
alias egrep="egrep --color=auto"
alias fgrep="fgrep --color=auto"
alias rgrep="rgrep --color=auto"
