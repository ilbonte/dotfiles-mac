#!/usr/bin/env bash

echo "Configuring shell..."

# Define the shell path
SHELL="/opt/homebrew/bin/bash"

grep -qxF "$SHELL" /etc/shells || echo "$SHELL" | sudo tee -a /etc/shells

echo "Changing default shell to $SHELL"
chsh -s "$SHELL"

echo "Shell configured!"
