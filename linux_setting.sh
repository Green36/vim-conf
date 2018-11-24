#!/bin/bash

UPDATE_FILES=( \
    "vimfiles,.vim" \
    "vimrc,.vimrc" \
    "vimrc,.config/nvim/init.vim" \
    "gvimrc,.gvimrc" \
    )

if [ ! -e ~/.config/nvim ]; then
    mkdir -p ~/.config/nvim
    echo "created ~/.config/nvim"
fi

CUR_DIR=`cd $(dirname $0) && pwd`
BACKUP_DIR="VimSettingBackup_"$( date "+%Y%m%d%H%M%S" )

mkdir ~/${BACKUP_DIR}
for file in ${UPDATE_FILES[@]}
do
    file=( `echo $file | tr ',' ' '` )
    if [ -e ~/${file[1]} ]; then
        mv ~/${file[1]} ~/${BACKUP_DIR}/
    fi
    ln -s ${CUR_DIR}/${file[0]} ~/${file[1]}
done

if [ ! -e ~/.vim/NeoBundle/neobundle.vim ]; then
    git clone https://github.com/Shougo/neobundle.vim.git ~/.vim/NeoBundle/neobundle.vim/
fi

