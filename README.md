# Installation
Requires Vim >= 8.0.
```
git clone git@github.com:mikeiovine/vimrc.git --recursive
cd vimrc
ln -s "$PWD"/.vimrc ~/.vimrc
ln -s "$PWD"/.vim ~/.vim
vim -c PluginInstall
cd ~/.vim/bundle/YouCompleteMe && python3 install.py [OPTIONS]
```

If using Vim in a terminal, set the color scheme to solarized
for best results.

For the `[OPTIONS]` in YCM's `install.py`, you probably just
want `--clangd-completer` for C++ completion. Use the script's
`--help` flag to see more options.
