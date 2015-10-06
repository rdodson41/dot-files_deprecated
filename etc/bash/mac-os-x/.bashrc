#!/bin/bash

#
#  Name:     rdodson41/dot-files/etc/bash/mac-os-x/.bashrc
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

#  Include ~/.bash_aliases if the user is running bash and ~/.bash_aliases exists 
if [[ -n "$BASH_VERSION" ]]; then
    if [[ -f "$HOME/.bash_aliases" ]]; then
        . "$HOME/.bash_aliases"
    fi
fi

#  Set the command line prompt
PS1="\[\033[01;32m\]\u@\h\[\033[00m\]:\[\033[01;34m\]\w\[\033[00m\]\$ "
