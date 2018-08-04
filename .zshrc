for f in $DOTFILES/zsh/*.zsh; do
  source "$f"
done

__zshrc_local=$HOME/.zshrc.local
[ -f $__zshrc_local ] && source $__zshrc_local
