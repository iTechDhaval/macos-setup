#!/usr/bin/env bash

code --install-extension Shan.code-settings-sync

cp -pr \
    ${BASE_DIR}/settings/VSCode-Settings.json \
    ${USER_HOME}/Library/Application\ Support/Code/User/settings.json
