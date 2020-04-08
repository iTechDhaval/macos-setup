#!/usr/bin/env bash

command -v brew >/dev/null || (echo "Installing Brew..." && echo | ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)")

# Install Brew Packages
brew install python
brew install tree
brew install zsh

# Install MacOS Applications
brew cask install iterm2
brew cask install google-chrome
brew cask install firefox
brew cask install visual-studio-code
brew cask install virtualbox
brew cask install sourcetree
brew cask install discord
brew cask install google-backup-and-sync
brew cask install skype
brew cask install gimp
brew cask install vlc
brew cask install divvy

# Install Source Code Pro Font
brew tap homebrew/cask-fonts
brew cask install font-source-code-pro
brew cask install font-fira-code
