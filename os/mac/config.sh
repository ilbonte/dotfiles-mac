#!/usr/bin/env bash

echo "Configuring MacOS..."

if ! command -v brew &>/dev/null; then
  echo "Installing Homebrew..."

  NONINTERACTIVE=1 bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
else
  unalias brew 2>/dev/null
  brewser=$(stat -f "%Su" $(which brew))
  alias brew='sudo -Hu '$brewser' brew'
fi

echo "Configuring applications..."
brew bundle --file=./os/mac/Brewfile

echo "MacOS configured!"
