source $ZPLUG_HOME/init.zsh

# 'zplug' self update
zplug 'zplug/zplug', hook-build:'zplug --self-manage'

# plugins
# zplug "zsh-users/zsh-completions"
# zplug "felixr/docker-zsh-completion"

zplug "zsh-users/zsh-autosuggestions"
zplug "zsh-users/zsh-syntax-highlighting"

zplug "zsh-users/zsh-history-substring-search"
if zplug check "zsh-users/zsh-history-substring-search"; then
    bindkey -M emacs '^P' history-substring-search-up
    bindkey -M emacs '^N' history-substring-search-down
fi

zplug "b4b4r07/enhancd", use:init.sh

zplug mafredri/zsh-async, from:github
zplug sindresorhus/pure, use:pure.zsh, from:github, as:theme

# Install plugins if there are plugins that have not been installed
# if ! zplug check --verbose; then
#     printf "Install? [y/N]: "
#     if read -q; then
#         echo; zplug install
#     fi
# fi

# Then, source plugins and add commands to $PATH
# zplug load --verbose
zplug load

