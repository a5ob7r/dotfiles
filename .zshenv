# environment
export LANG=ja_JP.UTF-8
export LC_TIME="C"

# tool confiture
export PAGER=less
export EDITOR=vim
export VISUAL=vim

# colorized for man with less
export LESS_TERMCAP_mb=$'\E[01;31m'      # Begins blinking.
export LESS_TERMCAP_md=$'\E[01;31m'      # Begins bold.
export LESS_TERMCAP_me=$'\E[0m'          # Ends mode.
export LESS_TERMCAP_se=$'\E[0m'          # Ends standout-mode.
export LESS_TERMCAP_so=$'\E[00;47;30m'   # Begins standout-mode.
export LESS_TERMCAP_ue=$'\E[0m'          # Ends underline.
export LESS_TERMCAP_us=$'\E[01;32m'      # Begins underline.

export HISTFILE=$HOME/.zsh_history
export HISTSIZE=100000
export SAVEHIST=100000
export HISTTIMEFORMAT="[%Y/%M/%D %H:%M:%S] "

export LS_COLORS='di=34:ln=35:so=32:pi=33:ex=31:bd=46;34:cd=43;34:su=41;30:sg=46;30:tw=42;30:ow=43;30'

# external configure
export VOLTPATH=$HOME/dotfiles/volt
export ZPLUG_HOME=$HOME/.zplug
export POWERLINE_ROOT=$HOME/Library/Python/3.6/lib/python/site-packages/powerline
export GOPATH=$HOME

# prevent adding duplication path
typeset -U path PATH

# add $path
path=(
    /usr/local/bin(N-/)
    $HOME/bin(N-/)
    /Library/TeX/texbin(N-/)
    $path
    $GOPATH/bin
)

# add anyanv commnad path to $PATH when no the command path
if [ -d $HOME/.anyenv ] ; then
    export PATH="$HOME/.anyenv/bin:$PATH"
    eval "$(anyenv init - --no-rehash)"

    # correspond tmux
    for D in `\ls $HOME/.anyenv/envs`
    do
        export PATH="$HOME/.anyenv/envs/$D/shims:$PATH"
    done
fi

# autoload
autoload -Uz colors && colors
autoload -Uz compinit && compinit -u
