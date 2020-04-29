#!/usr/bin/env bash

# Script to manage node version

# Uninstall default node installed with yarn
[[ -z $(which node | grep '.nvm') ]] && \
    brew uninstall node --ignore-dependencies

export NVM_DIR="$HOME/.nvm"
[ -s "/usr/local/opt/nvm/nvm.sh" ] \
  && . "/usr/local/opt/nvm/nvm.sh"  # This loads nvm
[ -s "/usr/local/opt/nvm/etc/bash_completion.d/nvm" ] \
  && . "/usr/local/opt/nvm/etc/bash_completion.d/nvm"  # This loads nvm bash_completion

nvm install --lts --no-progress

BREW_NODE_HOME='/usr/local/Cellar/node'
[[ ! -d "${BREW_NODE_HOME}" ]] && \
    mkdir $BREW_NODE_HOME

ln -s \
    $NVM_DIR/versions/node/$(nvm current)/ \
    $BREW_NODE_HOME

# Overwrite node, npm and npx from linked node in
# /usr/local/Cellar/node to /usr/local/bin/ homebrew
brew link --overwrite node

# Prevent Homebrew upgrading node version
brew pin node
