#!/bin/bash

ph=$(cd $(dirname "$0") && pwd )
echo $ph

ln -s "$ph" ~/.vim
ln -s ~/.vim/vimrc ~/.vimrc
