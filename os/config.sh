#!/usr/bin/env bash

echo "Installing package manager..."
if ! command -v brew 2>&1 >/dev/null; then
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
