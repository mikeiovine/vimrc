#!/bin/sh
VIM_FOLDER=~/.vim
VIMRC=~/.vimrc

install_main() {
    if [[ -d "$VIM_FOLDER" ]] || [[ -L "$VIM_FOLDER" ]]
    then
        echo "Found existing ~/.vim, removing..."
        rm -rf "$VIM_FOLDER"
    fi
    
    if [[ -f "$VIMRC" ]] || [[ -L "$VIMRC" ]]
    then
        echo "Found existing ~/.vimrc, removing..."
        rm "$VIMRC"
    fi

    cp -r ".vim" $VIM_FOLDER
    cp ".vimrc" $VIMRC
    echo "Installed to $VIMRC"
}

install_main

echo "Installing plugins..."
vim -c "PluginInstall" -c "qa"
python3 .vim/bundle/YouCompleteMe/install.py --clang-completer
echo "Install done."

