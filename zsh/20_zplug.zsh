source $ZPLUG_HOME/init.zsh

set_zsh_plugins() {
  # 'zplug' self update
  zplug 'zplug/zplug', hook-build:'zplug --self-manage'
  
  # plugins
  zplug "zsh-users/zsh-completions"
  zplug "zsh-users/zsh-autosuggestions"
  zplug "zsh-users/zsh-syntax-highlighting", defer:2
  
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
