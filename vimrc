

" pyenv virtualenv 3.6.1 neovim-3
" pyenv shell neovim-3
" pip install neovim

let g:python_host_prog=$PYENV_ROOT.'/versions/neovim-2/bin/python'
let g:python3_host_prog=$PYENV_ROOT.'/versions/neovim-3/bin/python'


if has('win32') || has('win64')
    source $USERPROFILE/vimfiles/rc/vimrc.vim
    source $USERPROFILE/vimfiles/plugin/localFunc.vim
else
    source ~/.vim/rc/vimrc.vim
    source ~/.vim/plugin/localFunc.vim
endif



