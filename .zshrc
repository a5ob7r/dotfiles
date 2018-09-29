for f in $DOTFILES/zsh/*.zsh; do
  source "$f"
done

__zshrc_local=~/.zshrc.local
[[ -f $__zshrc_local ]] && source $__zshrc_local

# Prevents .zshrc updating by zplugin installer.
# <<zplugin>>
