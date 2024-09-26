#!/usr/bin/env bash

echo "Configuring shell..."

NEW_SHELL="/usr/local/bin/bash"

# Check if the new shell is already in /etc/shells
if ! grep -Fxq "$NEW_SHELL" /etc/shells; then
    echo "Adding $NEW_SHELL to /etc/shells"
    echo "$NEW_SHELL" | sudo tee -a /etc/shells > /dev/null
else
    echo "$NEW_SHELL is already in /etc/shells"
fi

echo "Changing default shell to $NEW_SHELL"
chsh -s "$NEW_SHELL"

echo "Changing current shell to $NEW_SHELL"
exec "$NEW_SHELL"

echo "Shell configured!"
