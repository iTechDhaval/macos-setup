#!/usr/bin/env bash
############################
# This script creates symlinks from the home directory to any desired dotfiles in ${USER_HOME}/dotfiles
# And also installs Homebrew Packages
# And sets VSCode preferences
############################

if [ "$#" -ne 1 ]; then
    echo "Usage: install.sh <home_directory>"
    exit 1
fi

USER_HOME=$1

# scripts base directory
BASE_DIR=$( cd "$( dirname $0 )" && pwd )
# dotfiles directory
DOTFILES_DIR="${BASE_DIR}/dotfiles"
# scripts directory
SCRIPTS_DIR="${BASE_DIR}/scripts"

# change to the dotfiles directory
echo "Processing from the ${DOTFILES_DIR} directory"

# list of files/folders to symlink in ${USER_HOME}
files=$(find $DOTFILES_DIR -type f -exec basename {} \;)

# create symlinks (will overwrite old dotfiles)
for file in ${files}; do
    echo "Creating symlink to $file in home directory."
    ln -sf ${DOTFILES_DIR}/${file} ${USER_HOME}/${file}
done

# Download Git Auto-Completion
curl -fsSL "https://raw.githubusercontent.com/git/git/master/contrib/completion/git-completion.bash" -o ${USER_HOME}/.git-completion.bash

# list of scripts to execute for system setup
scripts=$(find $SCRIPTS_DIR -type f -exec basename {} \; | sort)

# run various scripts to install tools and applications
for script in ${scripts}; do
    script_name=$(echo ${script} | sed 's|\.sh||g')
    echo "Running script '$script_name'..."
    . ${SCRIPTS_DIR}/${script}
done
