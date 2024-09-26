#!/usr/bin/env bash

echo "Configuring MacOS..."

if ! command -v brew 2>&1 >/dev/null; then
  echo "Installing Homebrew..."
  /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
fi

echo "Configuring applications & libraries..."
brew bundle

echo "MacOS configured!"
