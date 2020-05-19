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
    htop-osx
    nvm
    yarn
    fastlane
    xhyve
    hyperkit
    docker-machine-driver-hyperkit
)
for pkg in "${PACKAGE_LIST[@]}"
do
    [ -z $(brew list | grep $pkg) ] \
        && brew install $pkg \
        || echo "${pkg} already installed"
done

# Print instruction to setup uid using root user
echo "==> docker-machine-driver-hyperkit"
echo "This driver requires superuser privileges to access the hypervisor. To
enable, execute"
echo "  sudo chown root:wheel /usr/local/opt/docker-machine-driver-hyperkit/bin/docker-machine-driver-hyperkit"
echo "  sudo chmod u+s /usr/local/opt/docker-machine-driver-hyperkit/bin/docker-machine-driver-hyperkit"

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
    citrix-workspace
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
)

if [ ! -z $(echo $HOME | grep 'vagrant') ]; then
    APP_LIST+=( virtualbox )
    APP_LIST+=( virtualbox-extension-pack )
fi

for app in "${APP_LIST[@]}"
do
    [ -z $(brew cask list | grep $app) ] \
        && brew cask install $app \
        || echo "Application '${app}' already installed."
done


# Install Source Code Pro Font
echo "Installing fonts..."
brew tap homebrew/cask-fonts

FONT_LIST=(
    font-fira-code
    font-firamono-nerd-font
    font-meslo-lg
    font-fontawesome
)
for font in "${FONT_LIST[@]}"
do
    [ -z $(brew cask list | grep $font) ] \
        && brew cask install $font \
        || echo "Font '${font}' already installed."
done
