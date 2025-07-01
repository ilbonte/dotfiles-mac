#!/usr/bin/env bash

# -----------------------------------------------------------------------------
# macOS 15.5 “Sequoia” setup script
# -----------------------------------------------------------------------------

# Close System Settings to avoid conflicts
osascript -e 'tell application "System Settings" to quit'

# Ask for admin privileges up front
sudo -v
# Keep-alive for sudo
while true; do sudo -n true; sleep 60; kill -0 "$$" || exit; done 2>/dev/null &

###############################################################################
# System Updates                                                              #
###############################################################################

# Install all available software updates
sudo softwareupdate --install --all --restart --verbose  # uses -i and -a flags :contentReference[oaicite:5]{index=5}

###############################################################################
# General UI / UX                                                             #
###############################################################################

# Mute the startup chime
sudo nvram StartupMute=%01

# Show battery percentage in menu bar via Control Center (new domain) :contentReference[oaicite:6]{index=6}
defaults -currentHost write com.apple.controlcenter BatteryShowPercentage -bool true

# Disable Gatekeeper “Are you sure?” dialog (re-enables “Anywhere”) :contentReference[oaicite:7]{index=7}
# 1) Open System Settings → Privacy & Security and leave it open
# 2) In Terminal:
sudo spctl --master-disable
# 3) Switch away and back in System Settings to reveal the “Anywhere” option

# Disable LaunchServices quarantine dialog
defaults write com.apple.LaunchServices LSQuarantine -bool false

# Disable Notification Center completely and hide its icon :contentReference[oaicite:8]{index=8}
launchctl unload -w /System/Library/LaunchAgents/com.apple.notificationcenterui.plist 2>/dev/null
# Also remove the icon from the menu bar
defaults write com.apple.systemuiserver 'NSStatusItem Visible NotificationCenter' -bool false
killall NotificationCenter || true
killall SystemUIServer || true

# Clear out the Dock’s persistent apps (fresh slate)
defaults write com.apple.dock persistent-apps -array

###############################################################################
# Trackpad, Mouse, Keyboard                                                  #
###############################################################################

# Enable tap-to-click (user & login screen)
defaults write com.apple.driver.AppleBluetoothMultitouch.trackpad Clicking -bool true
defaults -currentHost write NSGlobalDomain com.apple.mouse.tapBehavior -int 1
defaults write NSGlobalDomain com.apple.mouse.tapBehavior -int 1

# Three-finger swipe between pages
defaults write NSGlobalDomain AppleEnableSwipeNavigateWithScrolls -bool true
defaults -currentHost write NSGlobalDomain com.apple.trackpad.threeFingerHorizSwipeGesture -int 1
defaults write com.apple.driver.AppleBluetoothMultitouch.trackpad TrackpadThreeFingerHorizSwipeGesture -int 1

# Disable press-and-hold in favor of key repeat
defaults write NSGlobalDomain ApplePressAndHoldEnabled -bool false
# Fast key repeat
defaults write NSGlobalDomain KeyRepeat -int 1
defaults write NSGlobalDomain InitialKeyRepeat -int 15

###############################################################################
# Finder                                                                      #
###############################################################################

# Enable ⌘Q to quit Finder (hides desktop icons)
defaults write com.apple.finder QuitMenuItem -bool true
# Show hidden files, extensions, path bar, and full POSIX path
defaults write com.apple.finder AppleShowAllFiles -bool true
defaults write NSGlobalDomain AppleShowAllExtensions -bool true
defaults write com.apple.finder ShowPathbar -bool true
defaults write com.apple.finder _FXShowPosixPathInTitle -bool true
# Keep folders on top, disable extension-change warning
defaults write com.apple.finderix suy _FXSortFoldersFirst -bool true
defaults write com.apple.finder FXEnableExtensionChangeWarning -bool false
# Avoid .DS_Store on network/USB volumes
defaults write com.apple.desktopservices DSDontWriteNetworkStores -bool true
defaults write com.apple.desktopservices DSDontWriteUSBStores -bool true
# Auto-open new volumes
defaults write com.apple.frameworks.diskimages auto-open-ro-root -bool true
defaults write com.apple.frameworks.diskimages auto-open-rw-root -bool true
defaults write com.apple.finder OpenWindowForNewRemovableDisk -bool true

###############################################################################
# Dock                                                                        #
###############################################################################

# Show indicator lights, auto-hide, translucent hidden icons
defaults write com.apple.dock show-process-indicators -bool true
defaults write com.apple.dock autohide -bool true
defaults write com.apple.dock showhidden -bool true

###############################################################################
# Activity Monitor                                                            #
###############################################################################

# Open main window by default
defaults write com.apple.ActivityMonitor OpenMainWindow -bool true

###############################################################################
# New Sequoia-Specific Tweaks                                                 #
###############################################################################

# Suppress the Apple Intelligence first-run pop-up :contentReference[oaicite:9]{index=9}
defaults write com.apple.SetupAssistant DidSeeIntelligence -bool true

# (Optional) Mute weekly TCC/security pop-ups — no official key exists yet 😕
# Consider using a tool like “Amnesia” until Apple provides a toggle :contentReference[oaicite:10]{index=10}

# -----------------------------------------------------------------------------
# Restart affected services
# -----------------------------------------------------------------------------
killall Finder   || true
killall Dock     || true
killall SystemUIServer || true
