#!/usr/bin/env bash

command -v brew >/dev/null || (echo "Installing Brew..." && echo | ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)")

# Homebrew cleanup
brew install homebrew/cask-cask
brew update && brew cleanup

# Install Brew Packages
brew install python
brew install tree
brew install zsh
brew install zsh-syntax-highlighting
brew install youtube-dl
brew install bash-completion
brew install cowsay
brew install htop-osx

# Install MacOS Applications
echo "Installing Applications..."
brew cask install iterm2
brew cask install google-chrome
brew cask install firefox
brew cask install visual-studio-code
brew cask install virtualbox
brew cask install vagrant
brew cask install vagrant-manager
brew cask install sourcetree
brew cask install discord
brew cask install google-backup-and-sync
brew cask install skype
brew cask install gimp
brew cask install vlc
brew cask install divvy
brew cask install dropbox
brew cask install box-sync
brew cask install citrix-receiver
brew cask install skitch
brew cask install the-unarchiver

# Install Source Code Pro Font
echo "Installing fonts..."
brew tap homebrew/cask-fonts
brew cask install \
    font-fira-code \
    font-firamono-nerd-font \
    font-meslo-lg \
    font-fontawesome
