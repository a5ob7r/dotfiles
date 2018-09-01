function fghq() {
  local dir
  dir=$(ghq list | fzf-tmux) &&
    cd $(ghq root)/$dir
}

function fdkrmi() {
  local images
  images=$(docker images | fzf-tmux --multi --header-lines=1) &&
    echo $images | awk '{print $3}' | xargs docker rmi
}

function fdkrm() {
  local containers
  containers=$(docker container ls -a | fzf-tmux --multi --header-lines=1) &&
    echo $containers | awk '{print $1}' | xargs docker rm
}

function zshtimes() {
  for i in $(seq 1 10); do time zsh -i -c exit; done
}

function zshcompiles() {
  local f_zsh=($HOME/.zshrc $HOME/.zshenv `ls -1 $DOTFILES/zsh/*.zsh`)
  for f in $f_zsh; do zcompile $f; done
}
