#!/bin/bash

ph=$(cd $(dirname "$0") && pwd )
echo "current directory is: $ph"

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

# 判断.vim目录是否存在
if [ -L ~/.vim ]; then
    echo "~/.vim is a symbolic link"
    rm -v ~/.vim
elif [ -d ~/.vim ]; then
    echo "~/.vim is a directory"
    mv -v ~/.vim ~/vim.bak
fi

# 判断.vimrc是否存在
if [ -L ~/.vimrc ]; then
    echo "~/.vimrc is a symbolic link"
    rm -v ~/.vimrc
elif [ -f ~/.vimrc ]; then
    echo "~/.vimrc is a file"
    mv -v ~/.vimrc ~/vimrc.bak
fi

ln -vs "$ph" ~/.vim
ln -vs ~/.vim/vimrc ~/.vimrc

if [ ! -d $ph/bundle/Vundle.vim ]; then
    git clone https://github.com/VundleVim/Vundle.vim.git $ph/bundle/Vundle.vim
fi

vim +PluginInstall +qall
