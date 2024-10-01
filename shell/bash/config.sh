#!/usr/bin/env bash

echo "Configuring shell..."

echo "Configuring libraries..."
brew bundle --file=./shell/bash/Brewfile

# Define the shell path
SHELL_PATH="/opt/homebrew/bin/bash"

grep -qxF "$SHELL_PATH" /etc/shells || echo "$SHELL_PATH" | sudo tee -a /etc/shells

echo "Changing default shell to $SHELL_PATH"
if [ "$(ps -p $$ -o 'comm=')" != "bash" ]; then
  sudo chsh -s "$SHELL_PATH"
  exec "$SHELL_PATH"
fi

echo "Shell configured!"
