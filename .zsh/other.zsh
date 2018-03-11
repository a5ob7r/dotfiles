# use color prompt
autoload -U colors ; colors

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

