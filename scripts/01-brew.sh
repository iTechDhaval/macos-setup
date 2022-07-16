#!/usr/bin/env bash

command -v brew >/dev/null || ( echo "Installing Brew..." && export CI=1 && /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install.sh)" )

# Homebrew cleanup
echo "Activate some brew taps..."
brew tap homebrew/cask-fonts
brew tap homebrew/cask-drivers

echo "Update and cleanup brew..."
brew update && brew cleanup

echo "Install application via Brewfile..."
brew bundle install --global
