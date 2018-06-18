ghq-fzf() {
  local dir=$(ghq list > /dev/null | fzf-tmux) &&
    cd $(ghq root)/$dir
}
