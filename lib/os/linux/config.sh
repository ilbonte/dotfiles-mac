#!/usr/bin/env bash

echo "Configuring Linux..."

echo "Configuring applications..."
brew bundle --file=./lib/os/linux/Brewfile
