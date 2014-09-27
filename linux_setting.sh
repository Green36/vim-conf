#!/bin/bash

cd $(dirname $0)
path=`echo $(pwd)`

rm -Rf ~/.vim
ln -s ${path}/vimfiles ~/.vim 
cp ${path}/vimrc ~/.vimrc
cp ${path}/gvimrc ~/.gvimrc

if [ ! -e ~/.vim/NeoBundle/neobundle.vim ]; then
    git clone https://github.com/Shougo/neobundle.vim.git ~/.vim/NeoBundle/neobundle.vim/
fi


