
if has('win32') || has('win64')
    source $USERPROFILE/vimfiles/rc/vimrc.vim
    source $USERPROFILE/vimfiles/plugin/localFunc.vim
else
    source ~/.vim/rc/vimrc.vim
    source ~/.vim/plugin/localFunc.vim
endif



