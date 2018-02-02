autoload history-search-end
zle -N history-beginning-search-backward-end history-search-end
zle -N history-beginning-search-forward-end history-search-end

HISTFILE=$HOME/dotfiles/.zsh/zsh_histfile
HISTSIZE=10000
SAVEHIST=100000
HISTTIMEFORMAT="[%Y/%M/%D %H:%M:%S] "

