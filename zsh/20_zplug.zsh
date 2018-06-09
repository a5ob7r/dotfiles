source $ZPLUG_HOME/init.zsh

set_zsh_plugins() {
  # 'zplug' self update
  zplug 'zplug/zplug', hook-build:'zplug --self-manage'
  
  # plugins
  zplug "zsh-users/zsh-completions"
  zplug "felixr/docker-zsh-completion"
  if zplug check "felixr/docker-zsh-completion"; then
      zstyle ':completion:*:*:docker:*' option-stacking yes
      zstyle ':completion:*:*:docker-*:*' option-stacking yes
  fi
  
  zplug "zsh-users/zsh-autosuggestions"
  zplug "zsh-users/zsh-syntax-highlighting", defer:2
  
  zplug "zsh-users/zsh-history-substring-search"
  if zplug check "zsh-users/zsh-history-substring-search"; then
      bindkey -M emacs '^P' history-substring-search-up
      bindkey -M emacs '^N' history-substring-search-down
  fi
  
  zplug "junegunn/fzf-bin", as:command, from:gh-r, rename-to:fzf, use:"*darwin*amd64*"
  zplug "junegunn/fzf", as:command, use:bin/fzf-tmux
  
  zplug "b4b4r07/enhancd", use:init.sh
  
  zplug "mafredri/zsh-async", from:github
  zplug "sindresorhus/pure", use:pure.zsh, from:github, as:theme
}

load_zsh_plugins() {
  # Install plugins if there are plugins that have not been installed
  if ! zplug check --verbose; then
      printf "Install? [y/N]: "
      if read -q; then
          echo; zplug install
      fi
  fi
  
  # Then, source plugins and add commands to $PATH
  zplug load
}

if type "zplug" > /dev/null 2>&1; then
  set_zsh_plugins
  load_zsh_plugins
fi
