#             _                     
#     _______| |__   ___ _ ____   __
#    |_  / __| '_ \ / _ \ '_ \ \ / /
#   _ / /\__ \ | | |  __/ | | \ V / 
#  (_)___|___/_| |_|\___|_| |_|\_/  

# export CLICOLOR=1
# export LSCOLORS=ExFxBxDxCxegedabagacad

export PAGER=less
export LESS='-R'
export LESSOPEN='| /usr/local/bin/src-hilite-lesspipe.sh  %s'

export LANG=ja_JP.UTF-8
export LC_TIME="C"

if [ -z $TMUX ]; then
    export PATH="/usr/local/bin:$PATH"
    export PATH="$HOME/bin/:$PATH"
    export PATH="/Library/TeX/texbin/:$PATH"
fi


# -------------------------------------
# anyenv
# -------------------------------------

# add anyanv commnad path to $PATH when no the command path
if ! type anyenv > /dev/null 2>&1; then
    if [ -d $HOME/.anyenv ] ; then
        export PATH="$HOME/.anyenv/bin:$PATH"
        eval "$(anyenv init -)"
        # for D in `\ls $HOME/.anyenv/envs`
        # do
        #     export PATH="$HOME/.anyenv/envs/$D/shims:$PATH"
        # done
    fi
fi


# -------------------------------------
# Colorized man
# -------------------------------------

# export MANPAGER='less -R'

export LESS_TERMCAP_mb=$'\E[01;31m'      # Begins blinking.
export LESS_TERMCAP_md=$'\E[01;31m'      # Begins bold.
export LESS_TERMCAP_me=$'\E[0m'          # Ends mode.
export LESS_TERMCAP_se=$'\E[0m'          # Ends standout-mode.
export LESS_TERMCAP_so=$'\E[00;47;30m'   # Begins standout-mode.
export LESS_TERMCAP_ue=$'\E[0m'          # Ends underline.
export LESS_TERMCAP_us=$'\E[01;32m'      # Begins underline.

export VOLTPATH=$HOME/dotfiles/volt
export ZPLUG_HOME=$HOME/dotfiles/.zplug

