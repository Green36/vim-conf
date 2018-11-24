
IF EXIST %HOMEPATH%\.vim (
	rmdir /S /Q %HOMEPATH%\vimfiles
	del /Q %HOMEPATH%\vimrc
	del /Q %HOMEPATH%\gvimrc
) 

mklink /D %HOMEPATH%\vimfiles %~dp0\vimfiles
mklink %HOMEPATH%\_vimrc %~dp0\vimrc
mklink %HOMEPATH%\_gvimrc %~dp0\gvimrc

mkdir %HOMEPATH%\vimfiles\NeoBundle
git clone https://github.com/Shougo/neobundle.vim.git %HOMEPATH%\vimfiles\NeoBundle\neobundle.vim/

pause
