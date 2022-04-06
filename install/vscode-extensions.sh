#!/bin/bash

echo "Installing vscode extensions..."

extensions=(
ahmadawais.shades-of-purple
akamud.vscode-theme-onedark
arcticicestudio.nord-visual-studio-code
asvetliakov.vscode-neovim
be5invis.vscode-custom-css
danielpinto8zz6.c-cpp-compile-run
dbaeumer.vscode-eslint
esbenp.prettier-vscode
formulahendry.auto-rename-tag
ionutvmi.path-autocomplete
ms-python.python
ms-python.vscode-pylance
ms-toolsai.jupyter
ms-toolsai.jupyter-keymap
ms-toolsai.jupyter-renderers
ms-vscode.cpptools
PKief.material-icon-theme
PKief.material-product-icons
redhat.java
ritwickdey.LiveServer
ryuta46.multi-command
sleistner.vscode-fileutils
slevesque.vscode-autohotkey
vincaslt.highlight-matching-tag
VisualStudioExptTeam.vscodeintellicode
vscjava.vscode-java-debug
vscjava.vscode-java-dependency
vscjava.vscode-java-pack
vscjava.vscode-java-test
vscjava.vscode-maven
vscodevim.vim
zhuangtongfa.material-theme
# rust-lang.rust
matklad.rust-analyzer
)

for extension in "${extensions[@]}"; do
    codium --install-extension $extension
done

echo "Done"
