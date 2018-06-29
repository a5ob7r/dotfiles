syntax on

set showmatch

set virtualedit+=onemore
set backspace=indent,eol,start

set modeline
set breakindent
set showbreak=>>
set breakindentopt=shift:2,sbr

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
set tabstop=2
set shiftwidth=2
set softtabstop=2
set expandtab

" indent
filetype indent plugin on
set cindent

" search
set hlsearch
set incsearch
set ignorecase
set smartcase
set wrapscan
