#!/usr/bin/env bash

echo "Configuring shell..."

# Define the shell path
SHELL="/opt/homebrew/bin/bash"

grep -qxF "$SHELL" /etc/shells || echo "$SHELL" >>/etc/shells

echo "Changing default shell to $SHELL"
chsh -s "$SHELL"

echo "Changing current shell to $SHELL"
exec "$SHELL"

echo "Shell configured!"
