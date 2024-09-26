#!/usr/bin/env bash

echo "Configuring MacOS..."

if ! command -v brew &>/dev/null; then
    echo "Installing Homebrew..."
    NONINTERACTIVE=1 bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
    eval "$(/opt/homebrew/bin/brew shellenv)"
fi

echo "Configuring applications & libraries..."
brew bundle --file=./os/mac/Brewfile

echo "MacOS configured!"
