"" editor.vim

syntax on

set showmatch

set virtualedit+=onemore
set backspace=indent,eol,start

set breakindent
set showbreak=>>
set breakindentopt=shift:4,sbr

" start file edit on line at the time of the last doing
set display=lastline

" link vim kill-ring to OS clipboard
set clipboard+=unnamed

"" invisible char
" display invisible char
set list
" set char for display invisible one
set listchars=tab:▸\ ,eol:↲,extends:❯,precedes:❮

" tab
set tabstop=4
set shiftwidth=4
set softtabstop=4
set expandtab

filetype indent plugin on
augroup fileTypeIndent
    autocmd!
    autocmd FileType ruby   setlocal ts=2 sw=2 sts=2 ex
    autocmd FileType eruby  setlocal ts=2 sw=2 sts=2 ex
augroup END

set smartindent


" search
set hlsearch
set incsearch
set ignorecase
set smartcase
set wrapscan

