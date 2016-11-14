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

  Plug 'ctrlpvim/ctrlp.vim'
  Plug 'ntpeters/vim-better-whitespace'
  Plug 'powerline/fonts', { 'do': './install.sh' }
  Plug 'powerline/powerline', { 'rtp': 'powerline/bindings/vim' }
  Plug 'tpope/vim-fugitive'

  call plug#end()
endif

"  Initialize plugins
autocmd VimEnter * call s:initialize_powerline()
autocmd VimEnter * call s:initialize_vim_better_whitespace()

"  Initialize powerline
function s:initialize_powerline()
  if exists('g:powerline_loaded')
    set laststatus=2
    set noshowmode
    set noruler
  endif
endfunction

"  Initialize vim-better-whitespace
function s:initialize_vim_better_whitespace()
  if exists('g:loaded_better_whitespace_plugin')
    autocmd BufWritePre * StripWhitespace
  endif
endfunction
