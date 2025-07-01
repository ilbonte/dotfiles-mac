#!/usr/bin/env bash

echo "Configuring libraries..."
brew bundle --file=./lib/shell/Brewfile

ZSH_PATH="$(brew --prefix)/bin/zsh"
if [ "$SHELL" != "$ZSH_PATH" ]; then
  # add zsh to /etc/shells if needed
  grep -qxF "$ZSH_PATH" /etc/shells || echo "$ZSH_PATH" | sudo tee -a /etc/shells
  chsh -s "$ZSH_PATH"
  exec "$ZSH_PATH" -l
fi

if [ -n "$SSH_PRIVATE_KEY" ] && [ -n "$SSH_PUBLIC_KEY" ]; then
  echo "Writing SSH key pair..."
  echo "$SSH_PRIVATE_KEY" >~/.ssh/key
  chmod 600 ~/.ssh/key
  echo "$SSH_PUBLIC_KEY" >~/.ssh/key.pub
  chmod 644 ~/.ssh/key.pub
fi

echo "Shell configured!"
