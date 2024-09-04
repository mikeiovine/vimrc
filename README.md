# Installation
Requires Vim >= 8.0.
```
git clone git@github.com:mikeiovine/vimrc.git --recursive
cd vimrc
ln -s "$PWD"/.vimrc ~/.vimrc
ln -s "$PWD"/.vim ~/.vim
cd ~/.vim/bundle/YouCompleteMe && python3 install.py [OPTIONS]
vim -c PluginInstall
```

If using Vim in a terminal, set the color scheme to solarized
for best results.
