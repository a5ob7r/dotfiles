"" init.vim

set nocompatible
set encoding=utf-8

" destination directory of swapfile
set directory=~/.vim/tmp

set viminfo+=n$HOME/dotfiles/.vim/tmp/.viminfo

set lazyredraw
set ttyfast

" set title
set number

set cursorline
set nocursorcolumn

set background=dark
set termguicolors
set scrolloff=4

" status line
set laststatus=2
set cmdheight=2

set visualbell

" command line mode menu
set wildmenu
set wildmode=longest:full,full

if executable("rg")
    set grepprg=rg\ --vimgrep\ --no-heading
    set grepformat=%f:%l:%c:%m,%f:%l:%m
endif
