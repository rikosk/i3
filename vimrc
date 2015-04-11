"""""""" Vundle stuff """"""""""
set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'gmarik/Vundle.vim'

"My Bundles"
Plugin 'nanotech/jellybeans.vim'
Plugin 'vim-multiple-cursors'

call vundle#end()            " required
filetype plugin indent on    " required

""""""""" Vundle stuff end """"""""""

"enable filetype based syntax 
syntax enable 

"set encoding utf-8 
set encoding=utf-8 

"display incomplete commands
set showcmd

"show filename on terminal tile
set title

"set font and font-size
" set gfn=Anonymous\ Pro\ 11

"enable line numbers
set number

"set lines to start scroll
set scrolloff=8

"set tab (\t) size and identation level to 4 chars
set tabstop=4
set shiftwidth=4

"enable 256 colors (for terminal) & set colorscheme
"set t_Co=256
colorscheme jellybeans

"enable mouse support in terminal.
set mouse=a

"enable backup to centralized dirs (instead of current dir)
set backup
set backupdir=~/.vim/backup
set directory=~/.vim/tmp

"Enable colorcolumn @ char 80 if vim version supports it
if exists('+colorcolumn')
  set colorcolumn=80
  highlight ColorColumn ctermbg=darkgray guibg=darkgray
else
  au BufWinEnter * let w:m2=matchadd('ErrorMsg', '\%>80v.\+', -1)
endif

"" Searching
set hlsearch    "highlight matches
set incsearch   "incremental searching
set ignorecase  "case insensitive search...
set smartcase   " ... unless they contain atl least one capital letter.

"" gvim gui
set guioptions-=T

"when file is *.py, map <F5> to save && excecute, and tab to 4 spaces
autocmd BufRead *.py nmap <F5> <Esc>:w<CR>:!python %<CR>
autocmd BufRead *.py set tabstop=4 shiftwidth=4 expandtab

"when file is tex, map <F5> to pdflatex, and autobreak text @col 80.          
autocmd BufRead *.tex nmap <F5> <Esc>:w<CR>:!pdflatex %<CR>
autocmd BufRead *.tex setlocal textwidth=80
""autocmd BufRead *.py set nowrap
""autocmd BufRead *.py set go+=b
