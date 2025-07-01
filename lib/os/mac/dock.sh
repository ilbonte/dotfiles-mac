#!/usr/bin/env bash

if [[ "$(uname)" != "Darwin" ]]; then
  echo "Not on macOS. Exiting..."
  exit 0
fi

echo "Checking for dockutil…"
if ! command -v dockutil &>/dev/null; then
  echo "  → dockutil not found, installing via Homebrew…"
  # Ensure Homebrew is in PATH
  if command -v brew &>/dev/null; then
    brew install dockutil
  else
    echo "Error: Homebrew not found. Please install Homebrew first." >&2
    exit 1
  fi
fi

echo "Configuring Dock…"
# Remove all existing icons, then add back your favorites
dockutil --no-restart --remove all
dockutil --no-restart --add "/Applications/Launchpad.app"

# Add a small spacer before Chrome
dockutil --add '' --type small-spacer --section apps --before "Google Chrome"

# Your preferred apps
dockutil --no-restart --add "/Applications/Google Chrome.app"
dockutil --no-restart --add "/Applications/Kitty.app"
dockutil --no-restart --add "/Applications/Visual Studio Code.app"

# Restart the Dock to apply changes
killall Dock

echo "✅ Dock setup complete!"
