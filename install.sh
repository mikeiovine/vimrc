#!/bin/sh
INSTALL_DIR=/home/$USER/Documents

cd "$INSTALL_DIR"
git clone https://github.com/mikeiovine/vimrc.git
cd vimrc

ln -s "$INSTALL_DIR/vimrc/.vim" /home/$USER/.vim
ln -s "$INSTALL_DIR/vimrc/.vimrc" /home/$USER/.vimrc
echo "Installed to $INSTALL_DIR"

