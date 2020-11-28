#!/bin/bash

read -p "WARNING: Your configuration files will be replaced. Continue? (y/n)" -n 1 -r
echo


replace() {
    echo "Replacing $1 to: $HOME/$2"
    cp -P "$1" "$HOME/$2"
} 

replace_multiple() {
    echo "Replacing $1 to: $HOME/$2"
    cp -P "$1"* "$HOME/$2"
} 

if [[ $REPLY =~ ^[Yy]$ ]]
then
    replace .vimrc .vimrc
    replace .Xresources .Xresources
    replace .bashrc .bashrc
    replace .fzf.bash .fzf.bash
    replace .i3 .config/i3/config
    replace .i3blocks .config/i3blocks/config
    replace .vim/coc-settings.json .vim/
    replace_multiple .vim/after/ftplugin/ .vim/after/ftplugin/
    replace_multiple .vim/colors/ .vim/colors/
    replace_multiple .vim/indent/ .vim/indent/
fi
