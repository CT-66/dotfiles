#!/bin/bash

# temp file

ln -S ~/Dotfiles/zsh/.zshenv ~/.zshenv

plugins=(
    "https://github.com/zsh-users/zsh-autosuggestions"
    "https://github.com/zsh-users/zsh-syntax-highlighting"
    "https://github.com/hlissner/zsh-autopair"
)

for plugin in "${plugins[@]}"; do
    # git clone $plugin ~/Dotfiles/zsh/plugins
    git clone $plugin ~/.config/zsh/plugins
done
