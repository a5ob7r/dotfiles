bindkey -e

# for direnv
if (( $+commands[direnv] )); then
  eval "$(direnv hook zsh)"
fi

SPROMPT="zsh: correct: %F{red}%R%f -> %F{green}%r%f [No/Yes/Abort/Edit]? "

chpwd() { ll }
