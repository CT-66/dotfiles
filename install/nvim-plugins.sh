#!/bin/bash

echo "Installing nvim plugins..."

sh -c 'curl -fLo "${XDG_DATA_HOME:-$HOME/.local/share}"/nvim/site/autoload/plug.vim --create-dirs \
       https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'

nvim +PlugInstall +qall

cd $HOME/.local/share/nvim/plugged/vim-hexokinase
make hexokinase

echo "Done"
