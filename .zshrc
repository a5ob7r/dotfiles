for f in $DOTFILES/zsh/*.zsh; do
  source "$f"
done

[[ -f ~/.zshrc.local ]] && source ~/.zshrc.local

# Prevents .zshrc updating by zplugin installer.
# <<zplugin>>
