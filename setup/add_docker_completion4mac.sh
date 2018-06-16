# https://docs.docker.com/docker-for-mac/#zsh

etc=/Applications/Docker.app/Contents/Resources/etc
site_functions=/usr/local/share/zsh/site-functions

ln -s $etc/docker.zsh-completion $site_functions/_docker
ln -s $etc/docker-machine.zsh-completion $site_functions/_docker-machine
ln -s $etc/docker-compose.zsh-completion $site_functions/_docker-compose
