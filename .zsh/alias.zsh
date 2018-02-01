# -------------------------------------
# Alias
# -------------------------------------

setopt complete_aliases

# alias ezsh='vim ~/.zshrc'
# alias szsh='source ~/.zshrc'
alias grep="grep --color -n -I --exclude='*.svn-*' --exclude='entries' --exclude='*/cache/*'"
alias tree="tree -N"
alias ls="ls -AFG"
alias la="ls -hlT"

if [ -f /Applications/MacVim.app/Contents/MacOS/Vim ]; then
  alias vi='env LANG=ja_JP.UTF-8 /Applications/MacVim.app/Contents/MacOS/Vim "$@"'
  alias vim='env LANG=ja_JP.UTF-8 /Applications/MacVim.app/Contents/MacOS/Vim "$@"'
fi

