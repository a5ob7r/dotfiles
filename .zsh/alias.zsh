alias grep="grep --color -n -I --exclude='*.svn-*' --exclude='entries' --exclude='*/cache/*'"
alias la="ls -hlTAFG"

if [ -f /Applications/MacVim.app/Contents/MacOS/Vim ]; then
    alias mvim='env LANG=ja_JP.UTF-8 /Applications/MacVim.app/Contents/MacOS/Vim "$@"'
fi

if type tree > /dev/null 2>&1; then
    alias tree="tree -N"
fi

if type exa > /dev/null 2>&1; then
    alias ll='exa -lahg'
fi

