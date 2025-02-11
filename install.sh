#!/usr/bin/env bash
############################
# This script creates symlinks from the home directory to any desired dotfiles in ${USER_HOME}/dotfiles
# And also installs Homebrew Packages
# And sets VSCode preferences
############################

title() {
    echo ""
    for i in {1..40}; do echo -n "#"; done
    echo ""
    printf '%s:\t' "$1";
    echo ""
}

if [ "$#" -ne 1 ]; then
    USER_HOME=$HOME
fi

# scripts base directory
BASE_DIR=$( cd "$( dirname $0 )" && pwd )
# dotfiles directory
DOTFILES_DIR="${BASE_DIR}/dotfiles"
# scripts directory
SCRIPTS_DIR="${BASE_DIR}/scripts"

# change to the dotfiles directory
title "Processing from the ${DOTFILES_DIR} directory"

# list of files/folders to symlink in ${USER_HOME}
files=$(find $DOTFILES_DIR -type f -exec basename {} \;)

# create symlinks (will overwrite old dotfiles)
for file in ${files}; do
    title "Creating symlink to $file in home directory."
    ln -sf ${DOTFILES_DIR}/${file} ${USER_HOME}/${file}
done

# Download Git Auto-Completion
GIT_COMPLITION="${USER_HOME}/.git-completion.bash"

curl -fsSL \
    "https://raw.githubusercontent.com/git/git/master/contrib/completion/git-completion.bash" \
    -o ${USER_HOME}/.git-completion.bash

# list of scripts to execute for system setup
scripts=$(find $SCRIPTS_DIR -type f -exec basename {} \; | sort)

# run various scripts to install tools and applications
for script in ${scripts}; do
    script_name=$(echo ${script} | sed 's|\.sh||g')
    title "Running script '$script' starts..."
    . ${SCRIPTS_DIR}/${script}
    title "Running script '$script' ends..."
done
