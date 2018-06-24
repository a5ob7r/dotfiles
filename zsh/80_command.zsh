ghq-fzf() {
  local dir
  dir=$(ghq list | fzf-tmux) &&
    cd $(ghq root)/$dir
}

dkrmi-fzf() {
  local images
  images=$(docker images | fzf-tmux --multi --header-lines=1) &&
    echo $images | awk '{print $3}' | xargs docker rmi
}

dkrm-fzf() {
  local containers
  containers=$(docker container ls -a | fzf-tmux --multi --header-lines=1) &&
    echo $containers | awk '{print $1}' | xargs docker rm
}
