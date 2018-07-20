zstyle ':completion:*' matcher-list 'm:{a-z}={A-Z} r:|[._-]=*'
zstyle ':completion:*' verbose yes
zstyle ':completion:*' completer _expand _complete _match _approximate _list
zstyle ':completion:*' group-name ''
zstyle ':completion:*' list-separator '->'
zstyle ':completion:*' list-colors ${(s.:.)LS_COLORS}
zstyle ':completion:*' use-cache true
zstyle ':completion:*:messages' format $YELLOW'%d'$DEFAULT
zstyle ':completion:*:warnings' format $RED'No matches for: '$YELLOW'%d'
zstyle ':completion:*:options' description 'yes'
zstyle ':completion:*:descriptions' format $YELLOW'Completing %B%d%b%f'
zstyle ':completion:*:manuals' separate-sections true
zstyle ':completion:*:default' menu select=2

zmodload zsh/complist
bindkey -M menuselect 'h' vi-backward-char
bindkey -M menuselect 'j' vi-down-line-or-history
bindkey -M menuselect 'k' vi-up-line-or-history
bindkey -M menuselect 'l' vi-forward-char
