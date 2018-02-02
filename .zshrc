#             _              
#     _______| |__  _ __ ___ 
#    |_  / __| '_ \| '__/ __|
#   _ / /\__ \ | | | | | (__ 
#  (_)___|___/_| |_|_|  \___|

# -------------------------------------
# zplug
# -------------------------------------
source $HOME/dotfiles/.zsh/zplug.zsh


# -------------------------------------
# Alias
# -------------------------------------

source $HOME/dotfiles/.zsh/alias.zsh


# -------------------------------------
# Completion
# -------------------------------------

source $HOME/dotfiles/.zsh/completion.zsh


# -------------------------------------
# search history
# -------------------------------------

source $HOME/dotfiles/.zsh/search_hist.zsh


# -------------------------------------
# Prompt
# -------------------------------------

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

setopt prompt_subst
setopt correct
SPROMPT="zsh: correct: $RED%R$DEFAULT -> $GREEN%r$DEFAULT [No/Yes/Abort/Edit]? "


# -------------------------------------
# cd
# -------------------------------------

# cd search path
cdpath=($HOME)

function chpwd() { la; echo -ne "\033]0;$(pwd | rev | awk -F \/ '{print "/"$1"/"$2}'| rev)\007" }
setopt auto_cd
setopt auto_pushd
setopt pushd_ignore_dups

function cdup() { echo cd ..  zle reset-prompt
}
zle -N cdup
bindkey '^^' cdup


# -------------------------------------
# other
# -------------------------------------

bindkey -e
setopt ignoreeof
setopt nobeep
setopt notify
setopt print_eight_bit

setopt extended_history
setopt append_history
setopt hist_verify
setopt hist_expire_dups_first

setopt share_history
setopt hist_ignore_dups

setopt auto_menu
setopt auto_param_slash
setopt mark_dirs
setopt menu_complete
setopt list_packed
setopt list_types
setopt complete_in_word
setopt always_last_prompt
setopt auto_param_keys

# setopt auto_list
setopt extended_glob
setopt magic_equal_subst
setopt hist_expand


echo "${fg_bold[red]} _____      _          _ _  ${reset_color}"
echo "${fg_bold[red]}|__  /  ___| |__   ___| | | ${reset_color}"
echo "${fg_bold[red]}  / /  / __| '_ \ / _ \ | | ${reset_color}"
echo "${fg_bold[red]} / /_  \__ \ | | |  __/ | | ${reset_color}"
echo "${fg_bold[red]}/____| |___/_| |_|\___|_|_| ${reset_color}"

