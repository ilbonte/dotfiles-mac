#!/usr/bin/env bash

echo "Configuring shell..."

# Define the shell path
SHELL_PATH="/opt/homebrew/bin/bash"

grep -qxF "$SHELL_PATH" /etc/shells || echo "$SHELL_PATH" | sudo tee -a /etc/shells

echo "Changing default shell to $SHELL_PATH"
chsh -s "$SHELL_PATH"

if [ "$(ps -p $$ -o 'comm=')" != "bash" ]; then exec bash; fi

echo "Shell configured!"
