#!/usr/bin/env bash

[ -n "${USER_HOME}" ] || USER_HOME=$HOME
[ -n "${BASE_DIR}" ] || BASE_DIR=$(dirname $(pwd))

code --install-extension Shan.code-settings-sync

cp -pr \
    ${BASE_DIR}/settings/VSCode-Settings.json \
    ${USER_HOME}/Library/Application\ Support/Code/User/settings.json
