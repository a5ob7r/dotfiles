# My dotfiles

## Structures

- bin/* : Utility scripts, deployed to ~/bin/.
- home/* : Configurations, deployed to ~/.
- packages/* : Package list, library list, etc.
- templates/* : Templates of configuration which are preferred to copy and modify them for each environments rather than to use them directly.
- xdg_config_home/* : Configurations, deployed to ${XDG_CONFIG_HOME:-~/.config/}.

## Usage

```sh
git clone https://github.com/a5ob7r/dotfiles.git ~/src/github.com/a5ob7r/dotfiles
cd ~/src/github.com/a5ob7r/dotfiles
./INSTALL init
./INSTALL deploy
```

## Decoupled dotfiles

- Zsh: https://github.com/a5ob7r/zsh-config
- Vim: https://github.com/a5ob7r/vim-config
- Tmux: https://github.com/a5ob7r/tmux-config
- xmonad: https://github.com/a5ob7r/xmonad-config
