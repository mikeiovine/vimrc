#!/bin/sh
INSTALL_DIR=/home/$USER/Documents

make_symlinks() {
    if [[ -d "/home/$USER/.vim" ]]
    then
        echo "Found existing ~/.vim, removing..."
        rm -rf ~/.vim
    fi
    
    if [[ -f "/home/$USER/.vimrc" ]]
    then
        echo "Found existing ~/.vimrc, removing..."
        rm ~/.vimrc
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
python $INSTALL_DIR/.vim/bundle/YouCompleteMe/install.py --clang-completer
echo "Install done."

