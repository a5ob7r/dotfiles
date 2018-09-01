# for direnv
if (( $+commands[direnv] )); then
  eval "$(direnv hook zsh)"
fi

function chpwd() { ll }
