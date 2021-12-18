#!/bin/bash

echo "Installing zsh plugins..."

if [ -f ~/.zshenv ]; then
    mv ~/.zshenv ~/.zshenv.bak
fi

ln -s ~/Dotfiles/zsh/.zshenv ~/.zshenv

plugins=(
    "https://github.com/romkatv/powerlevel10k"
    "https://github.com/zsh-users/zsh-autosuggestions"
    "https://github.com/zsh-users/zsh-syntax-highlighting"
    "https://github.com/hlissner/zsh-autopair"
)

cd ~/Dotfiles/zsh/plugins

for plugin in "${plugins[@]}"; do
    # git clone $plugin ~/Dotfiles/zsh/plugins
    # git clone $plugin ~/.config/zsh/plugins
    git clone $plugin
done

echo "Done"
