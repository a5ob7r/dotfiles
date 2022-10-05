# My dotfiles

My main OS is Arch Linux. So this dotfiles is for Linux mainly. Also, contains
utility scripts and small configs only which I'm sure no need to separate them
as another repository.

## Another configs

I separate some tool configs as another repositories.

- Zsh: https://github.com/a5ob7r/zsh-config
- Vim: https://github.com/a5ob7r/vim-config
- Tmux: https://github.com/a5ob7r/tmux-config
- xmonad: https://github.com/a5ob7r/xmonad-config

## Strustures

- .config/* : Configs, deployed to ~/.config/.
- bin/* : Utility scripts, deployed to ~/bin/.
- home/* : Configs, deployed to ~/.
- misc/* : Template of configs which are difficult to manage with git directly.

## Usage

```sh
$ git clone https://github.com/a5ob7r/dotfiles.git ~/src/github.com/a5ob7r/dotfiles
$ cd ~/src/github.com/a5ob7r/dotfiles
$ ./INSTALL init
$ ./INSTALL deploy
```
