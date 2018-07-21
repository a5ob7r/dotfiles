source "$HOME/.zplugin/bin/zplugin.zsh"
autoload -Uz _zplugin
(( ${+_comps} )) && _comps[zplugin]=_zplugin

zplugin ice blockf
zplugin light 'zsh-users/zsh-completions'
zplugin light 'zsh-users/zsh-autosuggestions'

zplugin light 'zdharma/fast-syntax-highlighting'

zplugin ice pick"async.zsh" src"pure.zsh"
zplugin light 'sindresorhus/pure'

zplugin light 'b4b4r07/enhancd'
