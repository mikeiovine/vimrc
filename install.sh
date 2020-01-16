#!/bin/sh
INSTALL_DIR=/home/$USER/Documents

make_symlinks() {
    if [[ -d "~/.vim" ]]
    then
        echo "Found existing ~/.vim, removing..."
        rm -rf ~/.vim
    fi
    
    if [[ -f "~/.vimrc" ]]
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
    git clone https://github.com/mikeiovine/vimrc.git
else
    echo "vimrc found, updating..."
    cd "$INSTALL_DIR/vimrc"
    git pull
fi

make_symlinks

