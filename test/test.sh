#!/usr/bin/env bash

readonly COMMANDS=( \
  make \
  git \
  tig \
  ctags \
  vim \
  bash \
  zsh \
  tmux \
  fzf \
  volt \
  ghq \
  memo \
  anyenv \
)

readonly CONFIG_FILE_PATH=( \
  ~/.gitconfig \
  ~/.tigrc \
  ~/.ctags.d \
  ~/.vim \
  ~/.bashrc \
  ~/.bash_profile \
  ~/.zshenv \
  ~/.zprofile \
  ~/.zshrc \
  ~/.tmux.conf \
  ~/.tmux \
  ~/.config/alacritty
)

check_installed_commands() {
  local not_founds=()

  echo -e ":: \e[1mChecking installed commands...\e[m"

  for cmd in "${COMMANDS[@]}"; do
    echo -n "  Checking $cmd: "
    if type "$cmd" > /dev/null 2>&1; then
      echo "OK!"
    else
      echo "NO!"
      not_founds+=("$cmd")
    fi
  done

  echo
  if [[ ${#not_founds[@]} -eq 0 ]]; then
    echo -e "All commands are installed.\n"
  else
    echo -e "\e[31mCommands below are not installed.\e[m"

    for cmd in "${not_founds[@]}"; do
      echo "  - $cmd"
    done

    echo -e "\nPlease install commands above.\n"
    return 1;
  fi
}

check_configures() {
  local not_founds=()

  echo -e ":: \e[1mChecking configures...\e[m"

  for config in "${CONFIG_FILE_PATH[@]}"; do
    echo -n "  Checking $config: "
    if [[ -L $config ]]; then
      echo "OK!"
    else
      echo "NO!"
      not_founds+=("$config")
    fi
  done
  echo

  if [[ ${#not_founds[@]} -eq 0 ]]; then
    echo -e "All configures are found and linked.\n"
  else
    echo -e "\e[31mConfigures below are not found and linked.\e[m"

    for file in "${not_founds[@]}"; do
      echo "  - $file"
    done

    echo -e "\nPlease link configures above.\n"
    return 1;
  fi
}

main() {
  local is_all_test_pass=true

  check_installed_commands || is_all_test_pass=false
  check_configures || is_all_test_pass=false

  if ! $is_all_test_pass; then
    return 1;
  fi
}

main

