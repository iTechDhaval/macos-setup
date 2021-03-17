# MacOS environment setup
My dotfiles and personal preferences

## Motivation
I am working as DevOps engineer. I always prefer to create disposable environment using any short of tools. I started this project to setup my Hackintosh when i had to reconfigure the whole system multiple time. Frankly speaking i hate doing repeated suff so i looked on github for some short of easy way to use and maintain projects related to it. I came across the **https://github.com/CoreyMSchafer/dotfiles** repository which solved my minimalistic purpose of setting up system using simple scripts. I forked the repo and improved it according to my interests.

## Prerequisites
* Update MacOS using software update via command line.
  ```Bash
  sudo softwareupdate --install --all
  ```

## Usage
```Bash
git clone https://github.com/iTechDhaval/macos-setup.git

cd macos-setup && chmod +x ./install.sh scripts/*

./install.sh $HOME
```

## Optional
If you want to skip some personal apps installation then run below command to activate it.
```
echo "Office Laptop so skip some personal app installation" >> $HOME/.config/office-system
```
## Features
* Install dotfiles
  * .aliases
  * .bash_profiles
  * .bashrc
  * .gitconfig
  * .gitignore
  * .vimrc
  * .zshrc
  * .p10k.zsh
* Install applications and packages using brew.
* Setup VS Code
* Install OZSH and configure powerlevel10k theme.
* Install basic python packages.
* Install NVM (node version manager) and install stable version of node.

## TODO
* Setup iTerms2 terminal settings via script.

## Notes
> We can not automate everything so there are some manual setup after running above script.