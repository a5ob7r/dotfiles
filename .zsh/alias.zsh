alias grep="grep --color -n -I --exclude='*.svn-*' --exclude='entries' --exclude='*/cache/*'"
alias la="ls -hlTAFG"

if [ -f /Applications/MacVim.app/Contents/MacOS/Vim ]; then
    VIM_ALIAS='env LANG=ja_JP.UTF-8 /Applications/MacVim.app/Contents/MacOS/Vim "$@"'
    alias vi=${VIM_ALIAS}
    alias vim=${VIM_ALIAS}
fi

if type tree > /dev/null 2>&1; then
    alias tree="tree -N"
fi

