bindkey -e

# for direnv
if type direnv > /dev/null 2>&1; then
  eval "$(direnv hook zsh)"
fi

if type pipenv > /dev/null 2>&1; then
  eval "$(pipenv --completion)"
fi

# define colors
local DEFAULT=%{$reset_color%}
local RED=%{$fg[red]%}
local GREEN=%{$fg[green]%}
local YELLOW=%{$fg[yellow]%}
local BLUE=%{$fg[blue]%}
local PURPLE=%{$fg[purple]%}
local CYAN=%{$fg[cyan]%}
local WHITE=%{$fg[white]%}

SPROMPT="zsh: correct: $RED%R$DEFAULT -> $GREEN%r$DEFAULT [No/Yes/Abort/Edit]? "

function chpwd() { ll; echo -ne "\033]0;$(pwd | rev | awk -F \/ '{print "/"$1"/"$2}'| rev)\007" }
