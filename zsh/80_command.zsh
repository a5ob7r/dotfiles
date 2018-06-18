ghq-fzf() {
  local dir
  dir=$(ghq list | fzf-tmux) &&
    cd $(ghq root)/$dir
}
