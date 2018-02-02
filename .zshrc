source $HOME/dotfiles/.zsh/zplug.zsh
source $HOME/dotfiles/.zsh/alias.zsh
source $HOME/dotfiles/.zsh/completion.zsh
source $HOME/dotfiles/.zsh/search_hist.zsh

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


# -------------------------------------
# cd
# -------------------------------------

# cd search path
cdpath=($HOME)

function chpwd() { la; echo -ne "\033]0;$(pwd | rev | awk -F \/ '{print "/"$1"/"$2}'| rev)\007" }


# -------------------------------------
# other
# -------------------------------------

bindkey -e

setopt always_last_prompt
setopt append_history
setopt auto_list
setopt auto_menu
setopt auto_param_keys
setopt auto_param_slash
setopt auto_pushd
setopt correct
setopt extended_glob
setopt extended_history
setopt hist_expand
setopt hist_expire_dups_first
setopt hist_ignore_dups
setopt hist_verify
setopt ignoreeof
setopt list_packed
setopt list_types
setopt magic_equal_subst
setopt mark_dirs
setopt menu_complete
setopt nobeep
setopt noflowcontrol
setopt notify
setopt print_eight_bit
setopt prompt_subst
setopt pushd_ignore_dups
setopt share_history


echo "${fg_bold[red]} _____      _          _ _  ${reset_color}"
echo "${fg_bold[red]}|__  /  ___| |__   ___| | | ${reset_color}"
echo "${fg_bold[red]}  / /  / __| '_ \ / _ \ | | ${reset_color}"
echo "${fg_bold[red]} / /_  \__ \ | | |  __/ | | ${reset_color}"
echo "${fg_bold[red]}/____| |___/_| |_|\___|_|_| ${reset_color}"

