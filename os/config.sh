#!/usr/bin/env bash

echo "Installing package manager..."
IS_PACKAGE_MANAGER_INSTALLED=$(command -v brew 2>&1 >/dev/null)
if ! $IS_PACKAGE_MANAGER_INSTALLED; then
  NONINTERACTIVE=1 bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
fi

echo "Detecting OS..."

case $(uname -s) in
Darwin)
  if ! $IS_PACKAGE_MANAGER_INSTALLED; then
    echo 'eval "$(/opt/homebrew/bin/brew shellenv)"' >>~/.bashrc
    eval "$(/opt/homebrew/bin/brew shellenv)"
    source ~/.bashrc
  fi
  bash ./os/mac/config.sh
  ;;
Linux)
  if ! $IS_PACKAGE_MANAGER_INSTALLED; then
    echo 'eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv)"' >>~/.bashrc
    eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv)"
    source ~/.bashrc
  fi
  bash ./os/linux/config.sh
  ;;
*)
  echo "Unsupported OS configuration!"
  ;;
esac
