source $HOME/dotfiles/.zsh/env.zsh
source $HOME/dotfiles/.zsh/tmux.zsh
source $HOME/dotfiles/.zsh/zplug.zsh
source $HOME/dotfiles/.zsh/alias.zsh
source $HOME/dotfiles/.zsh/completion.zsh
source $HOME/dotfiles/.zsh/search_hist.zsh
source $HOME/dotfiles/.zsh/option.zsh

# use Color Prompt
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


# cd search path
cdpath=($HOME)

function chpwd() { la; echo -ne "\033]0;$(pwd | rev | awk -F \/ '{print "/"$1"/"$2}'| rev)\007" }


bindkey -e

echo "${fg_bold[red]} _____      _          _ _  ${reset_color}"
echo "${fg_bold[red]}|__  /  ___| |__   ___| | | ${reset_color}"
echo "${fg_bold[red]}  / /  / __| '_ \ / _ \ | | ${reset_color}"
echo "${fg_bold[red]} / /_  \__ \ | | |  __/ | | ${reset_color}"
echo "${fg_bold[red]}/____| |___/_| |_|\___|_|_| ${reset_color}"

