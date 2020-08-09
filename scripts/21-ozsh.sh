#!/usr/bin/env bash

[ -n "${USER_HOME}" ] || USER_HOME=$HOME
[ -n "${BASE_DIR}" ] || BASE_DIR=$( cd "$(dirname $0)" && dirname $(pwd) )

ZSH_CUSTOM="$USER_HOME/.oh-my-zsh/custom"

[ ! -d "$USER_HOME/.oh-my-zsh" ] && \
    ( echo "Installing oh-my-zsh..." \
        && sh -c \
            "$(curl \
                -fsSL \
                https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)" \
            "" --unattended \
    )

[[ ! -d "$ZSH_CUSTOM/themes/powerlevel10k" ]] && \
    git clone \
        --depth=1 \
        https://github.com/romkatv/powerlevel10k.git \
        $ZSH_CUSTOM/themes/powerlevel10k

[[ ! -d "$ZSH_CUSTOM/plugins/zsh-syntax-highlighting" ]] && \
    git clone \
        --depth=1 \
        https://github.com/zsh-users/zsh-syntax-highlighting.git \
        $ZSH_CUSTOM/plugins/zsh-syntax-highlighting

echo "Setup Zsh as default shell"
WHICH_ZSH=$(which zsh)
[[ -z $(cat /etc/shells | grep $WHICH_ZSH) ]] \
    && ( sudo sh -c "echo $WHICH_ZSH >> /etc/shells" \
        && chsh -s $WHICH_ZSH \
    )