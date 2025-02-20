# Installation
Requires Vim >= 9.1.0016. Will probably also work on Vim 8,
but some things (colors + LSP plugin) might not work.

```
git clone git@github.com:mikeiovine/vimrc.git --recursive
cd vimrc
ln -s "$PWD"/.vimrc ~/.vimrc
ln -s "$PWD"/.vim ~/.vim
vim -c PluginInstall
cd ~/.vim/bundle/YouCompleteMe && python3 install.py [OPTIONS]
```

For the `[OPTIONS]` in YCM's `install.py`, you probably just
want `--clangd-completer` for C++ completion. Use the script's
`--help` flag to see more options.

## `ftplugin`s

By convention, all `ftplugin`s in this repository are in the
`.vim/after/ftplugin` directory. I generally want to use
vim's defaults and then add/change a few settings as needed.
Putting all settings in `after/` guarantees that my settings
will overrule vim's if the default plugin has any conflicts.

There are also no `if exists('b:did_after_ftplugin')` guards
in these files. This is intentional, I want the files to be
sourced again if I source my `.vimrc` for quick editing.
