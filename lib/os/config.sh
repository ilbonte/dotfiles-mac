#!/usr/bin/env bash

source ~/.bashrc

echo "Installing package manager..."
IS_PACKAGE_MANAGER_INSTALLED=$(command -v brew 2>&1 >/dev/null)
if ! $IS_PACKAGE_MANAGER_INSTALLED; then
  NONINTERACTIVE=1 bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
fi

echo "Detecting OS..."

case $(uname -s) in
Darwin)
  if ! $IS_PACKAGE_MANAGER_INSTALLED; then
    MACOS_PACKAGE_MANAGER_PATH="/opt/homebrew/bin/brew"
    echo "eval \"\$(${MACOS_PACKAGE_MANAGER_PATH} shellenv)\"" >> ~/.bashrc
    eval "$MACOS_PACKAGE_MANAGER_PATH shellenv"
    source ~/.bashrc
  fi
  bash ./lib/os/mac/config.sh
  ;;
Linux)
  if ! $IS_PACKAGE_MANAGER_INSTALLED; then
    LINUX_PACKAGE_MANAGER_PATH="/home/linuxbrew/.linuxbrew/bin/brew"
    echo "eval \"\$(${LINUX_PACKAGE_MANAGER_PATH} shellenv)\"" >> ~/.bashrc
    eval "$LINUX_PACKAGE_MANAGER_PATH shellenv"
    source ~/.bashrc
  fi
  bash ./lib/os/linux/config.sh
  ;;
*)
  echo "Unsupported OS configuration!"
  ;;
esac
