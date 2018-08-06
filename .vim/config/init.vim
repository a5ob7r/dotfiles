set nocompatible

set encoding=utf-8
" determine character code automatically
set fileencodings=iso-2022-jp,euc-jp,sjis,utf-8,shift_jis,cp932,ucs-bom

" destination directory of swapfile
set directory=~/.vim/tmp

set viminfo+=n$DOTFILES/.vim/tmp/.viminfo

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
