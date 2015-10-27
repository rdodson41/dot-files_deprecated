"
"  Name:     rdodson41/dot-files/home/.vimrc
"  Author:   Richard E. Dodson <richard.elias.dodson@gmail.com>
"  Created:  Mon Sep 21 18:22:22 UTC 2015
"  License:  GNU General Public License, Version 3, 29 June 2007
"  
"  Copyright (C) 2015 Richard E. Dodson <richard.elias.dodson@gmail.com>
"  
"  This file is part of dot-files.
"
"  dot-files is free software: you can redistribute it and/or modify
"  it under the terms of the GNU General Public License as published by
"  the Free Software Foundation, either version 3 of the License, or
"  (at your option) any later version.
"  
"  dot-files is distributed in the hope that it will be useful,
"  but WITHOUT ANY WARRANTY; without even the implied warranty of
"  MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the
"  GNU General Public License for more details.
"  
"  You should have received a copy of the GNU General Public License
"  along with dot-files. If not, see <http://www.gnu.org/licenses/>.
"

"  Set indentation
set tabstop=4
set shiftwidth=4

"  Set scroll offset
set scrolloff=8

"  Enable title
set title

"  Enable cursor line
set cursorline

"  Enable line numbers
set number

"  Enable incremental search
set incsearch

"  Highlight search matches
set hlsearch

"  Enable automatic completion menu
set wildmenu

"  Enable syntax colorization
syntax enable

"  Set number of terminal colors to 16
set t_Co=16

"  Set background to dark
set background=dark

"  Set color scheme to Solarized
colorscheme solarized

"  Map j and k to move up and down visually when the user is in normal mode
nnoremap j gj
nnoremap k gk

"  Map up and down to move up and down visually when the user is in normal mode
nnoremap <up> g<up>
nnoremap <down> g<down>
