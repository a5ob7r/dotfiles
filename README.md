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
- etc/* : Utility scripts to setup this repository.
- home/* : Configs, deployed to ~/.
- misc/* : Template of configs which are difficult to manage with git directly.
- test/* : Test utility for this repository.

## Usage

```sh
$ git clone https://github.com/a5ob7r/dotfiles.git
$ cd dotfiles
$ ./INSTALL init
$ ./INSTALL deploy
```
