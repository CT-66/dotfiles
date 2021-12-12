#!/bin/bash

extensions=(
ahmadawais.shades-of-purple
akamud.vscode-theme-onedark
arcticicestudio.nord-visual-studio-code
asvetliakov.vscode-neovim
be5invis.vscode-custom-css
coenraads.bracket-pair-colorizer
danielpinto8zz6.c-cpp-compile-run
dbaeumer.vscode-eslint
dbaeumer.vscode-eslint
esbenp.prettier-vscode
formulahendry.auto-rename-tag
ionutvmi.path-autocomplete
ms-python.vscode-pylance
ms-toolsai.jupyter
ms-toolsai.jupyter-keymap
ms-vscode.cpptools
ms-vscode.cpptools
pkief.material-icon-theme
pkief.material-product-icons
redhat.java
ritwickdey.liveserver
shan.code-settings-sync
sleistner.vscode-fileutils
slevesque.vscode-autohotkey
vincaslt.highlight-matching-tag
visualstudioexptteam.vscodeintellicode
visualstudioexptteam.vscodeintellicode
vscjava.vscode-java-debug
vscjava.vscode-java-dependency
vscjava.vscode-java-pack
vscjava.vscode-java-test
vscjava.vscode-maven
vscjava.vscode-maven
vscode
vscodevim.vim
zhuangtongfa.material-theme
zhuangtongfa.material-theme
)

for extension in "${extensions[@]}"; do
    code --install-extension $extension
done
