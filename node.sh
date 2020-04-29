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