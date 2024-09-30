#!/usr/bin/env bash

echo "Configuring shell..."

if ! command -v brew &>/dev/null; then
  echo "Installing Homebrew..."

  NONINTERACTIVE=1 bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
else
  unalias brew 2>/dev/null
  brewser=$(stat -f "%Su" $(which brew))
  alias brew='sudo -Hu '$brewser' brew'
fi

echo "Configuring libraries..."
brew bundle --file=./shell/bash/Brewfile

# Define the shell path
SHELL_PATH="/opt/homebrew/bin/bash"

grep -qxF "$SHELL_PATH" /etc/shells || echo "$SHELL_PATH" | sudo tee -a /etc/shells

echo "Changing default shell to $SHELL_PATH"
chsh -s "$SHELL_PATH"

if [ "$(ps -p $$ -o 'comm=')" != "bash" ]; then exec "$SHELL_PATH"; fi

echo "Shell configured!"
