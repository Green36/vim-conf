
if has('win32') || has('win64')
    source $USERPROFILE/vimfiles/my_vimrc.vim
    source $USERPROFILE/vimfiles/my_func.vim
else
    source ~/.vim/my_vimrc.vim
    source ~/.vim/my_func.vim
endif



