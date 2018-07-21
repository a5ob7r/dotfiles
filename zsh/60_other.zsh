bindkey -e

# for direnv
if (( $+commands[direnv] )); then
  eval "$(direnv hook zsh)"
fi

SPROMPT="zsh: correct: $RED%R$DEFAULT -> $GREEN%r$DEFAULT [No/Yes/Abort/Edit]? "

chpwd() { ll }
