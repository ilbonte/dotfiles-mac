#!/usr/bin/env bash

echo "Configuring shell..."

# Define the shell path
SHELL_PATH="/opt/homebrew/bin/bash"

grep -qxF "$SHELL_PATH" /etc/shells || echo "$SHELL_PATH" | sudo tee -a /etc/shells

echo "Changing default shell to $SHELL_PATH"
chsh -s "$SHELL_PATH"

if [ "$(ps -p $$ -o 'comm=')" != "bash" ]; then exec "$SHELL_PATH"; fi

if ! command -v brew &>/dev/null; then
  echo "Installing Homebrew..."
  NONINTERACTIVE=1 bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
  eval "$(/opt/homebrew/bin/brew shellenv)"
fi

unalias brew 2>/dev/null
brewser=$(stat -f "%Su" $(which brew))
alias brew='sudo -Hu '$brewser' brew'

echo "Configuring applications & libraries..."
brew bundle --file=./shell/bash/Brewfile

echo "Shell configured!"
