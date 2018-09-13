" {{{ environment
set nocompatible
" }}}

" {{{ character encoding
set encoding=utf-8
" determine character code automatically
set fileencodings=utf-8,sjis,shift_jis,iso-2022-jp,euc-jp,cp932,ucs-bom
" }}}

" {{{ rendering
set lazyredraw
set ttyfast
" }}}

" {{{ window
set number

"set cursorline

set background=dark
set termguicolors

set scrolloff=4
" }}}

" {{{ status line
set laststatus=2
set cmdheight=2

" command line mode menu
set wildmenu
set wildmode=longest:full,full
" }}}

" {{{ other
set visualbell

if executable("rg")
  set grepprg=rg\ --vimgrep\ --no-heading
  set grepformat=%f:%l:%c:%m,%f:%l:%m
endif
" }}}
