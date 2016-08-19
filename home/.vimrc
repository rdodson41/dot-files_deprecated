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

"  Set key code delay to 0
set ttimeoutlen=0

"  Set indentation
set tabstop=2
set softtabstop=2
set shiftwidth=2
set expandtab
set autoindent

"  Set scroll offset
set scrolloff=8

"  Set backspace
set backspace=2

"  Enable title
set title

"  Enable cursor line
set cursorline

"  Enable line numbers
set number

"  Show mode
set showmode

"  Show command
set showcmd

"  Enable ruler
set ruler

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

"  Map j and k to move cursor up and down visually if user is in normal mode
nnoremap j gj
nnoremap k gk

"  Map up and down to move cursor up and down visually if user is in normal mode
nnoremap <up> g<up>
nnoremap <down> g<down>

"  Set plugins
if filereadable(glob('~/.vim/autoload/plug.vim'))
  call plug#begin()

  Plug 'ntpeters/vim-better-whitespace'
  Plug 'powerline/fonts', { 'do': './install.sh' }
  Plug 'powerline/powerline', { 'rtp': 'powerline/bindings/vim' }
  Plug 'tpope/vim-fugitive'

  call plug#end()
endif

"  Initialize plugins
autocmd VimEnter * call s:initialize_vim_better_whitespace()
autocmd VimEnter * call s:initialize_powerline()

"  Initialize vim-better-whitespace
function s:initialize_vim_better_whitespace()
  if exists('g:loaded_better_whitespace_plugin')
    autocmd BufWritePre * StripWhitespace
  endif
endfunction

"  Initialize powerline
function s:initialize_powerline()
  if exists('g:powerline_loaded')
    set laststatus=2
    set noshowmode
    set noruler
  endif
endfunction
