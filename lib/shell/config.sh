#!/usr/bin/env bash

echo "Configuring libraries..."
brew bundle --file=./lib/shell/Brewfile

SHELL_PATH="/opt/homebrew/bin/bash"
if [ "$SHELL" != "$SHELL_PATH" ]; then
  grep -qxF "$SHELL_PATH" /etc/shells || echo "$SHELL_PATH" | sudo tee -a /etc/shells
  chsh -s "$SHELL_PATH"
  exec "$SHELL_PATH"
fi

if [ -n "$SSH_PRIVATE_KEY" ] && [ -n "$SSH_PUBLIC_KEY" ]; then
  echo "Writing SSH key pair..."
  echo "$SSH_PRIVATE_KEY" >~/.ssh/key
  chmod 600 ~/.ssh/key
  echo "$SSH_PUBLIC_KEY" >~/.ssh/key.pub
  chmod 644 ~/.ssh/key.pub
fi

# if xcodebuild command available accept license
if command -v xcodebuild >/dev/null; then
  sudo xcodebuild -license accept
fi

echo "Shell configured!"
