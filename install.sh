#!/bin/sh
INSTALL_DIR=/home/$USER/misc

VIM_FOLDER=/home/$USER/.vim
VIMRC=/home/$USER/.vimrc

make_symlinks() {
    if [[ -d "$VIM_FOLDER" ]] || [[-L "$VIM_FOLDER" ]]
    then
        echo "Found existing ~/.vim, removing..."
        rm -rf "$VIM_FOLDER"
    fi
    
    if [[ -f "$VIMRC" ]] || [[ -L "$VIMRC" ]]
    then
        echo "Found existing ~/.vimrc, removing..."
        rm "$VIMRC"
    fi

    ln -s "$INSTALL_DIR/vimrc/.vim" /home/$USER/.vim
    ln -s "$INSTALL_DIR/vimrc/.vimrc" /home/$USER/.vimrc
    echo "Installed to $INSTALL_DIR"
}

if [[ ! -d "$INSTALL_DIR/vimrc" ]]
then
    echo "vimrc not found, cloning..."
    cd "$INSTALL_DIR"
    git clone --recurse-submodules https://github.com/mikeiovine/vimrc.git
fi

make_symlinks

echo "Installing plugins..."
vim -c "PluginInstall" -c "qa"
python $INSTALL_DIR/vimrc/.vim/bundle/YouCompleteMe/install.py --clang-completer
echo "Install done."

