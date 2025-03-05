#!/usr/bin/env bash

set -eou pipefail

# This script installs .vim and .vimrc to a specified output directory.
# You can either install the files as copies (with the -c option) or
# as symlinks to the files in this directory.
#
# This script does NOT do plugin installation; the YCM compilation step
# is a bit different for some of my workflows. It's a one-time setup
# anyways.

do_copy=0
install_location=~

while getopts "o:hc" opt; do
    case $opt in
        c)
            do_copy=1
            ;;
        o)
            install_location="$OPTARG"
            ;;
        h | *)
            echo "usage: install.sh [-h] [-c] [-o output_dir]"
            exit 0
            ;;
    esac
done

mkdir -p "$install_location"

remove_old_files() {
    local dst=$1
    if [[ -f "$dst" || -d "$dst" || -L "$dst" ]]; then
        read -p "Removing $dst. OK? (y to confirm) "
        if [[ "$REPLY" == "y" || "$REPLY" == "Y" ]]; then
            rm -rf "$dst"
        else
            echo "Aborted."
            exit 1
        fi
    fi
}

dst_vim_dir="$install_location"/.vim
dst_vimrc="$install_location"/.vimrc

remove_old_files "$install_location"/.vim
remove_old_files "$install_location"/.vimrc

script_dir=$(dirname $(realpath "$0"))
src_vim_dir="$script_dir"/.vim
src_vimrc="$script_dir"/.vimrc

if (("$do_copy")); then
    cp -r "$src_vim_dir" "$dst_vim_dir"
    cp "$src_vimrc" "$dst_vimrc"
else
    ln -s "$src_vim_dir" "$dst_vim_dir"
    ln -s "$src_vimrc" "$dst_vimrc"
fi

