#!/bin/bash

#
#  Name:     rdodson41/dot-files/home/.bash_aliases
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

#  Alias ls to:
#    -F, --classify               indicate file type
#    -G, --color=auto             colorize output if standard output is connected to a terminal
#    -T, --time-style=long-iso    list times in long-iso format
#    -h, --human-readable         list sizes in human-readable format
#    -l, --format=long            list files in long format
case "$KERNAL_NAME" in
"Darwin")
	alias ls="ls -FGThl"
	;;
"Linux")
	alias ls="ls -Fhl --time-style=long-iso --color=auto"
	;;
esac

#  Alias ls to:
#    -A, --almost-all             list all files with the exception of . and ..
#    -R, --recursive              list subdirectories recursively
alias l="ls"
alias la="ls -A"
alias lar="ls -AR"
alias lr="ls -R"
alias lra="ls -RA"

#  Alias grep, egrep, fgrep, and rgrep to:
#        --color=auto             colorize output if standard output is connected to a terminal
alias grep="grep --color=auto"
alias egrep="egrep --color=auto"
alias fgrep="fgrep --color=auto"
alias rgrep="rgrep --color=auto"

#  Alias git
alias g="git"
for alias in $(git config --get-regexp ^alias[.] | cut -d " " -f 1 | cut -d "." -f 2-); do
	alias "g${alias}"="git ${alias}"
done

#  Alias exit
alias x="exit"
