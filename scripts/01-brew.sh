#!/usr/bin/env bash

command -v brew >/dev/null || ( echo "Installing Brew..." && export CI=1 && /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install.sh)" )

# Homebrew cleanup
brew tap homebrew/cask-drivers
brew update && brew cleanup

# Install Brew Packages
PACKAGE_LIST=(
    python
    pipenv
    tree
    zsh
    zsh-syntax-highlighting
    youtube-dl
    bash-completion
    cowsay
    htop
    nvm
    yarn
    fastlane
    kompose
    helm
    helmfile
    handbrake
)
for pkg in "${PACKAGE_LIST[@]}"
do
    [ -z $(brew list | grep "$pkg\$") ] \
        && brew install $pkg \
        || echo "${pkg} already installed"
done

# Install MacOS Applications
echo "Installing Applications..."
APP_LIST=(
    iterm2
    google-chrome
    firefox
    visual-studio-code
    discord
    google-backup-and-sync
    skype
    gimp
    vlc
    dropbox
    box-sync
    skitch
    the-unarchiver
    docker
    intel-power-gadget
    webtorrent
    pycharm-ce
    microsoft-office
    sketchpacks
    skyfonts
    paw
    zoomus
    chromedriver
    logitech-unifying
    slack
    sonos
    vnc-viewer
    whatsapp
    minishift
    plex-media-player
    upwork
    logitech-options
    printopia
    handbrake
    dotnet-sdk
    google-cloud-sdk
)

if [ ! -z $(echo $HOME | grep 'vagrant') ]; then
    APP_LIST+=( virtualbox )
    APP_LIST+=( virtualbox-extension-pack )
fi

for app in "${APP_LIST[@]}"
do
    [ -z $(brew list --cask | grep $app) ] \
        && brew install --cask $app \
        || echo "Application '${app}' already installed."
done


# Install Source Code Pro Font
echo "Installing fonts..."
brew tap homebrew/cask-fonts

FONT_LIST=(
    font-fira-code
    font-fira-mono-nerd-font
    font-fontawesome
)
for font in "${FONT_LIST[@]}"
do
    [ -z $(brew list --cask | grep $font) ] \
        && brew install --cask $font \
        || echo "Font '${font}' already installed."
done
