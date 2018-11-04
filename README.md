# dotfiles
## tools
- [Zsh](https://github.com/zsh-users/zsh)
  - [zplugin](https://github.com/zdharma/zplugin) - zsh plugin manager

- [Vim](https://github.com/vim/vim)
  - [volt](https://github.com/vim-volt/volt) - vim plugin manager

- [fzf](https://github.com/junegunn/fzf) - fuzzy finder for command line tool

## Usage
### Use Installer Script
1. Fetch download script and run it.
```shell
# need git
$ curl https://raw.githubusercontent.com/a5ob7r/dotfiles/master/etc/install.sh | sh
```

### Manual Install
1. Fetch repository.
```shell
$ git clone https://github.com/a5ob7r/dotfiles.git
```

2. Make symbolic link of dot files to $HOME directory.
```shell
$ cd path/to/dotfiles

$ make link
```
