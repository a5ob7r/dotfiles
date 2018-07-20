bindkey -e

# for direnv
if type direnv > /dev/null 2>&1; then
  eval "$(direnv hook zsh)"
fi

SPROMPT="zsh: correct: $RED%R$DEFAULT -> $GREEN%r$DEFAULT [No/Yes/Abort/Edit]? "

chpwd() { ll }
