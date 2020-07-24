#!/usr/bin/env bash
############################
# This script creates symlinks from the home directory to any desired dotfiles in ${homedir}/dotfiles
# And also installs Homebrew Packages
# And sets VSCode preferences
############################

if [ "$#" -ne 1 ]; then
    echo "Usage: install.sh <home_directory>"
    exit 1
fi

homedir=$1

# dotfiles directory
dotfiledir=$( cd "$( dirname $0 )" && pwd )

# change to the dotfiles directory
echo "Processing from the ${dotfiledir} directory"

# list of files/folders to symlink in ${homedir}
files="vimrc bash_profile bashrc aliases private gitconfig gitignore p10k.zsh zshrc"

# create symlinks (will overwrite old dotfiles)
for file in ${files}; do
    echo "Creating symlink to $file in home directory."
    ln -sf ${dotfiledir}/.${file} ${homedir}/.${file}
done

# Download Git Auto-Completion
curl -fsSL "https://raw.githubusercontent.com/git/git/master/contrib/completion/git-completion.bash" -o ${homedir}/.git-completion.bash

# Run the Homebrew Script
. ${dotfiledir}/brew.sh

# Run the VSCode Script
. ${dotfiledir}/vscode.sh

# Run the oh my zsh setup Script
. ${dotfiledir}/ozsh.sh

# Run python package installation Script
. ${dotfiledir}/python.sh

# Run node setup script Script
. ${dotfiledir}/node.sh
