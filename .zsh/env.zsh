# environment
export LANG=ja_JP.UTF-8
export LC_TIME="C"

# tool confiture
export PAGER=less
export EDITOR=vim
export VISUAL=vim

# external configure
export VOLTPATH=$HOME/dotfiles/volt
export ZPLUG_HOME=$HOME/dotfiles/.zplug

# prevent adding duplication path
typeset -U path PATH

# add $PATH
export PATH="/usr/local/bin:$PATH"
export PATH="$HOME/bin/:$PATH"
export PATH="/Library/TeX/texbin/:$PATH"

# add anyanv commnad path to $PATH when no the command path
if [ -d $HOME/.anyenv ] ; then
    export PATH="$HOME/.anyenv/bin:$PATH"
    eval "$(anyenv init -)"

    # correspond tmux
    for D in `\ls $HOME/.anyenv/envs`
    do
        export PATH="$HOME/.anyenv/envs/$D/shims:$PATH"
    done
fi

# less source highlight
export LESS='-R'
export LESSOPEN='| /usr/local/bin/src-hilite-lesspipe.sh  %s'

# colorized for man with less
export LESS_TERMCAP_mb=$'\E[01;31m'      # Begins blinking.
export LESS_TERMCAP_md=$'\E[01;31m'      # Begins bold.
export LESS_TERMCAP_me=$'\E[0m'          # Ends mode.
export LESS_TERMCAP_se=$'\E[0m'          # Ends standout-mode.
export LESS_TERMCAP_so=$'\E[00;47;30m'   # Begins standout-mode.
export LESS_TERMCAP_ue=$'\E[0m'          # Ends underline.
export LESS_TERMCAP_us=$'\E[01;32m'      # Begins underline.

