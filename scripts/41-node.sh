#!/usr/bin/env bash
# Script to manage node version

[ -n "${USER_HOME}" ] || USER_HOME=$HOME

# Remove the symbol link which we linked node in Homebrew /usr/local/Cellar/node
echo "Removing existing node installation from Homebrew..."
[[ ! -z $(brew list -1 | grep node) ]] \
  && brew unlink node
[[ -d "/usr/local/Cellar/node" ]] \
  && rm -rf /usr/local/Cellar/node

# Unpin node in Homebrew for upgrading yarn
echo "Unpin node from Homebrew upgrade..."
[[ ! -z $(brew list -1 | grep node) ]] \
  && brew unpin node

# Upgrade yarn
echo "Upgrading yarn to latest version..."
brew upgrade yarn

# Uninstall default node installed with yarn
[[ -z $(which node | grep '.nvm') ]] && \
    brew uninstall node --ignore-dependencies

export NVM_DIR="$USER_HOME/.nvm"
[ -s "$(brew --prefix)/opt/nvm/nvm.sh" ] \
  && \. "$(brew --prefix)/opt/nvm/nvm.sh" # This loads nvm
[ -s "$(brew --prefix)/opt/nvm/etc/bash_completion.d/nvm" ] \
  && \. "$(brew --prefix)/opt/nvm/etc/bash_completion.d/nvm" # This loads nvm bash_completion

echo "Installing lts version of node using nvm..."
nvm install --lts --no-progress

BREW_NODE_HOME='/usr/local/Cellar/node'
[[ ! -d "${BREW_NODE_HOME}" ]] && \
    mkdir $BREW_NODE_HOME

echo "Link current version node in Homebrew..."
ln -s \
    $NVM_DIR/versions/node/$(nvm current)/ \
    $BREW_NODE_HOME

# Overwrite node, npm and npx from linked node in
# /usr/local/Cellar/node to /usr/local/bin/ homebrew
echo "Fix nodejs link in Homebrew..."
[[ ! -z $(brew list -1 | grep node) ]] \
  && $(brew unlink node && brew link --overwrite node)

echo "Prevent Homebrew upgrading node version..."
[[ ! -z $(brew list -1 | grep node) ]] \
  && brew pin node

NODE_MODULE_LIST=(
    @angular/cli
    firebase-tools
    gitmoji-cli
    gitmoji-changelog
)
for module in "${NODE_MODULE_LIST[@]}"
do
    [[ -z $(npm list -g --depth=0 | grep "$module") ]] \
        && npm install -g $module \
        || echo "Node module '${module}' already installed."
done
