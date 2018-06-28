fghq() {
  local dir
  dir=$(ghq list | fzf-tmux) &&
    cd $(ghq root)/$dir
}

fdkrmi() {
  local images
  images=$(docker images | fzf-tmux --multi --header-lines=1) &&
    echo $images | awk '{print $3}' | xargs docker rmi
}

fdkrm() {
  local containers
  containers=$(docker container ls -a | fzf-tmux --multi --header-lines=1) &&
    echo $containers | awk '{print $1}' | xargs docker rm
}
