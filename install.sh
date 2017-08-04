#!/bin/bash

ph=$(cd $(dirname "$0") && pwd )
echo $ph

# 安装git
if [ "$(whereis -b git|awk '{print $2}')" == "" ]; then
    sudo apt install git
fi
# 安装ctags
if [ "$(whereis -b ctags|awk '{print $2}')" == "" ]; then
    sudo apt install exuberant-ctags
fi
# 安装golang
if [ "$(whereis -b go|awk '{print $2}')" == "" ]; then
    sudo apt install golang
fi

git clone https://github.com/VundleVim/Vundle.vim.git $ph/bundle/Vundle.vim

ln -s "$ph" ~/.vim
ln -s ~/.vim/vimrc ~/.vimrc

vim +PluginInstall +qall
