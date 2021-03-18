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
    bash-completion
    cowsay
    htop
    nvm
    yarn
    helm
    helmfile
)

PACKAGE_LIST_EXTRA=(
    youtube-dl
    fastlane
)

[ ! -f "$HOME/.config/office-system" ] \
    && PACKAGE_LIST_EXTRA+=( PACKAGE_LIST_EXTRA )

for pkg in "${PACKAGE_LIST[@]}"
do
    [ -z $(brew list | grep "$pkg\$") ] \
        && brew install $pkg \
        || echo "${pkg} already installed"
done

# Install MacOS Applications
echo "Installing Applications..."
APP_LIST_BASE=(
    iterm2
    vagrant
    google-chrome
    visual-studio-code
    vlc
    the-unarchiver
    docker
    minishift
)

APP_LIST_EXTRA=(
    discord
    dropbox
    box-sync
    skitch
    pycharm-ce
    microsoft-office
    logitech-options
    google-backup-and-sync
    intel-power-gadget
    webtorrent
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
    printopia
    handbrake
    dotnet-sdk
    google-cloud-sdk
)


[ ! -f "$HOME/.config/office-system" ] \
    && APP_LIST_BASE+=( APP_LIST_EXTRA )

if [ ! -z $(command -v vagrant) ]; then
    APP_LIST_BASE+=( virtualbox )
    APP_LIST_BASE+=( virtualbox-extension-pack )
fi

for app in "${APP_LIST_BASE[@]}"
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
