#!/usr/bin/env bash

code --install-extension Shan.code-settings-sync

cp -pr \
    ${dotfiledir}/settings/VSCode-Settings.json \
    ${homedir}/Library/Application\ Support/Code/User/settings.json
