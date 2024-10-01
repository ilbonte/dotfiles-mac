#!/usr/bin/env bash

echo "Installing package manager..."
IS_PACKAGE_MANAGER_INSTALLED=$(command -v brew >/dev/null 2>&1)
if ! $IS_PACKAGE_MANAGER_INSTALLED; then
  NONINTERACTIVE=1 bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
fi

echo "Detecting OS..."

case $(uname -s) in
Darwin)
  bash ./os/mac/config.sh
  ;;
Linux)
  bash ./os/linux/config.sh
  ;;
*)
  echo "Unsupported OS configuration!"
  ;;
esac
