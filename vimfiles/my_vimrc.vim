" {{{ *** 基本設定 ***

" This must be first, because it changes other options as a side effect.
set nocompatible
" keep 500 lines of command line history
set history=500
" do incremental searching
set incsearch

" In many terminal emulators the mouse works just fine, thus enable it.
if has('mouse')
    set mouse=a
endif

" Switch syntax highlighting on, when the terminal has colors
" Also switch on highlighting the last used search pattern.
if &t_Co > 2 || has("gui_running")
    syntax on
    set hlsearch
endif

set autoindent  " always set autoindenting on

" 検索時に大文字小文字を無視 (noignorecase:無視しない)
set ignorecase

" 大文字小文字の両方が含まれている場合は大文字小文字を区別
set smartcase

"新しい行を作ったときに高度な自動インデントを行う
set smartindent

"行頭の余白内で Tab を打ち込むと、'shiftwidth' の数だけインデントする。
set smarttab

" タブの画面上での幅
set tabstop=4

" タブをスペースに展開しない (expandtab:展開する)
set noexpandtab

" 自動的にインデントする (noautoindent:インデントしない)
set autoindent

" バックスペースでインデントや改行を削除できるようにする
set backspace=indent,eol,start

" 検索時にファイルの最後まで行ったら最初に戻らない (wrapscan戻る)
set nowrapscan

" 括弧入力時に対応する括弧を表示 (noshowmatch:表示しない)
set showmatch

" コマンドライン補完するときに強化されたものを使う(参照 :help wildmenu)
set wildmenu

" 行番号を非表示 (number:表示)
set nonumber

" ルーラーを表示 (noruler:非表示)
set ruler

" タブや改行を表示 (nolist:非表示)
set list

" どの文字でタブや改行を表示するかを設定
if !has('gui_running')
    set listchars=tab:▸\ ,trail:_,nbsp:%,extends:>,precedes:<,eol:¬
endif

" 長い行を折り返さない (wrap:折り返す)
set nowrap

" 常にステータス行を表示 (詳細は:he laststatus)
set laststatus=2

" コマンドラインの高さ (Windows用gvim使用時はgvimrcを編集すること)
set cmdheight=2

" コマンドをステータス行に表示
set showcmd

" タイトルを表示
set title

" set encoding
set encoding=utf-8
set fileencodings=ucs-bom,iso-2022-jp-3,iso-2022-jp,eucjp-ms,euc-jisx0213,euc-jp,sjis,cp932,utf-8

" display line number
set number

" set folding
set foldmethod=marker

" set tab size.
set softtabstop=4
set shiftwidth=4

" convert tab to space.
set expandtab

" highlight cursor line.
set cursorline

" Stop auto new line
set textwidth=0
set formatoptions+=q

filetype plugin on

" コマンドモードでの補完設定
set wildmode=longest:full,list
" }}}

" {{{ *** OS別設定 ***

if has('win32') || has('win64')
    " バックアップファイルを作るディレクトリ
    set backupdir=$USERPROFILE/vimfiles/etc/backup

    " スワップファイル用のディレクトリ
    set directory=$USERPROFILE/vimfiles/etc/backup

    " grep設定
    set grepformat=%f:%l:%m,%f:%l%m,%f\ \ %l%m,%f
    set grepprg=findstr\ /SN

    let mygrepprg   = 'findstr'

    " neomru 保存場所
    let g:neomru#file_mru_path=expand('$USERPROFILE/vimfiles/etcwin/neomru/file')
    let g:neomru#directory_mru_path=expand('$USERPROFILE/vimfiles/etcwin/neomru/direcroty')

    " vimwiki 格納場所
    let g:vimwiki_list = [{'path':'$USERPROFILE/vimfiles/etc/wiki/', 'path_html':'$USERPROFILE/vimfiles/etc/wikihtml/'}]

    " NeoComplecache define dictionary.
    let g:neocomplcache_dictionary_filetype_lists = {
                \ 'default' : '',
                \ 'vimshell' : '$USERPROFILE/vimfiles/etc/neocomplcache/.vimshell_hist',
                \ 'scheme' : '$USERPROFILE/vimfiles/etc/neocomplcache/.gosh_completions'
                \ }
    " QFixHowm set path
    let howm_dir = '$USERPROFILE/vimfiles/etc/howm'

else
    " バックアップファイルを作るディレクトリ
    set backupdir=~/.vim/etc/backup/

    " スワップファイル用のディレクトリ
    set directory=~/.vim/etc/backup/
    let s:uname = system('uname')

    " grep設定
    set grepformat=%f:%l:%m,%f:%l%m,%f\ \ %l%m,%f
    set grepprg=grep\ -nrIH

    let mygrepprg   = 'grep'

    " neomru 保存ファイル
    let g:neomru#file_mru_path=expand('~/.vim/etc/neomru/file')
    let g:neomru#directory_mru_path=expand('~/.vim/etc/neomru/direcroty')

    " vimwiki 格納場所
    let g:vimwiki_list = [{'path':'~/.vim/etc/wiki/', 'path_html':'~/.vim/etc/wikihtml/'}]

    " NeoComplecache define dictionary.
    let g:neocomplcache_dictionary_filetype_lists = {
                \ 'default' : '',
                \ 'vimshell' : '~/.vim/etc/neocomplcache/.vimshell_hist',
                \ 'scheme' : '~/.vim/etc/neocomplcache/.gosh_completions'
                \ }

    " colorscheme setting.
    let g:hybrid_use_Xresources = 1

    " QFixHowm set path
    let howm_dir = '~/.vim/etc/howm'

    if !has('win32unix')
        " 無名レジスタと*レジスタに入れる
        " set clipboard+=unnamed
        set clipboard=unnamedplus
    endif

endif

" }}}

" ### NeoBundle Setting ### {{{

if has('win32') || has('win64')
    set rtp+=$USERPROFILE/vimfiles/NeoBundle/neobundle.vim/
    call neobundle#begin(expand('$USERPROFILE/vimfiles/NeoBundle'))
else
    set rtp+=~/.vim/NeoBundle/neobundle.vim/
    call neobundle#begin(expand('~/.vim/NeoBundle'))
endif

" call vundle#rc()
NeoBundle 'Shougo/neobundle.vim.git'
NeoBundle 'Shougo/neocomplcache'
NeoBundle 'Shougo/neomru.vim', {
            \ 'depends' : 'Shougo/unite.vim'
            \ }
NeoBundleLazy 'Shougo/unite.vim' , {
    \   'autoload' : { 'commands' : [ 'Unite' ] }
    \ }
let s:bundle = neobundle#get('unite.vim')
function! s:bundle.hooks.on_source(bundle)
    " ### Unite Setting ### {{{
    " The prefix key.
    nnoremap    [unite]   <Nop>
    nmap   <Space>u [unite]

    " Add bookmark
    nnoremap <silent> [unite]a :<C-u>UniteBookmarkAdd<CR>
    " bookmark
    nnoremap <silent> [unite]b :<C-u>Unite bookmark<CR>
    " history of files opened
    nnoremap <silent> [unite]u  :<C-u>:Unite file_mru<CR>
    " current directory
    nnoremap <silent> [unite]c  :<C-u>UniteWithCurrentDir -buffer-name=files file file_mru buffer bookmark<CR>
    " directory for the initial narrowing text.
    nnoremap <silent> [unite]i  :<C-u>UniteWithBufferDir  -buffer-name=files -prompt=%\  buffer file_mru bookmark file<CR>
    " files in current directory.
    nnoremap <silent> [unite]f  :<C-u>UniteWithBufferDir  -buffer-name=files -prompt=%\  file<CR>
    " buffer
    nnoremap <silent> [unite]h  :<C-u>Unite buffer<CR>
    " register
    nnoremap <silent> [unite]r  :<C-u>Unite -buffer-name=register register<CR>
    " outline
    nnoremap <silent> [unite]o  :<C-u>Unite -vertical -no-quit -wrap outline<CR>
    " sources
    nnoremap <silent> [unite]m  :<C-u>Unite -buffer-name=resume resume<CR>
    " directory_mru
    nnoremap <silent> [unite]d  :<C-u>Unite -buffer-name=files -default-action=lcd directory_mru<CR>
    " grep
    nnoremap <silent> [unite]g  :Unite grep:%:-iHRn<CR>
    " snipet
    nnoremap <silent> [unite]s  :Unite snippet<CR>

    nnoremap <silent> [unite]ma :<C-u>Unite mapping<CR>
    nnoremap <silent> [unite]me :<C-u>Unite output:message<CR>
    " sources
    nnoremap  [unite]m  :<C-u>Unite source<CR>


    " Start insert.
    let g:unite_enable_start_insert = 1
    "let g:unite_enable_short_source_names = 1

    let g:unite_winwidth = 25

    autocmd FileType unite call s:unite_my_settings()
    function! s:unite_my_settings()"{{{
        " Overwrite settings.
    
        nmap <buffer> <ESC>   <Plug>(unite_exit)
        imap <buffer> jj      <Plug>(unite_insert_leave)
    
        imap <buffer><expr> j unite#smart_map('j', '')
        imap <buffer> <TAB>   <Plug>(unite_select_next_line)
        imap <buffer> <C-w>   <Plug>(unite_delete_backward_path)
        imap <buffer> '       <Plug>(unite_quick_match_default_action)
        nmap <buffer> '       <Plug>(unite_quick_match_default_action)
        imap <buffer><expr> x
                    \ unite#smart_map('x', "\<Plug>(unite_quick_match_choose_action)")
        nmap <buffer> x       <Plug>(unite_quick_match_choose_action)
        nmap <buffer> <C-z>   <Plug>(unite_toggle_transpose_window)
        imap <buffer> <C-z>   <Plug>(unite_toggle_transpose_window)
        imap <buffer> <C-y>   <Plug>(unite_narrowing_path)
        nmap <buffer> <C-y>   <Plug>(unite_narrowing_path)
        nmap <buffer> <C-j>   <Plug>(unite_toggle_auto_preview)
        nmap <buffer> <C-r>   <Plug>(unite_narrowing_input_history)
        imap <buffer> <C-r>   <Plug>(unite_narrowing_input_history)
        nnoremap <silent><buffer><expr> l
                    \ unite#smart_map('l', unite#do_action('default'))

        let unite = unite#get_current_unite()
        if unite.buffer_name =~# '^search'
            nnoremap <silent><buffer><expr> r     unite#do_action('replace')
        else
            nnoremap <silent><buffer><expr> r     unite#do_action('rename')
        endif

        nnoremap <silent><buffer><expr> cd     unite#do_action('lcd')
        nnoremap <buffer><expr> S      unite#mappings#set_current_filters(
                    \ empty(unite#mappings#get_current_filters()) ? ['sorter_reverse'] : [])
    endfunction"}}}

    let g:unite_source_file_mru_limit = 500
    let g:unite_cursor_line_highlight = 'TabLineSel'
    let g:unite_abbr_highlight = 'TabLine'

    " For optimize.
    let g:unite_source_file_mru_filename_format = ''

    if executable('jvgrep')
        " For jvgrep.
        let g:unite_source_grep_command = 'jvgrep'
        let g:unite_source_grep_default_opts = '--exclude ''\.(git|svn|hg|bzr)'''
        let g:unite_source_grep_recursive_opt = '-R'
    endif

    " }}}
endfunction
" NeoBundle 'Shougo/unite.vim'
NeoBundle 'Shougo/unite-outline.git'
NeoBundle 'Shougo/vimfiler'
NeoBundle 'Shougo/vimproc', {
            \ 'build' : {
            \ 'windows' : 'make -f make_mingw32.mak',
            \ 'cygwin'  : 'make -f make_cygwin.mak',
            \ 'mac'     : 'make -f make_mac.mak',
            \ 'unix'    : 'make -f make_unix.mak',
            \ },
            \ }
NeoBundle 'Shougo/vimshell'
NeoBundle 'thinca/vim-quickrun'
NeoBundle 'thinca/vim-fontzoom'
NeoBundle 'thinca/vim-ref.git'
NeoBundle 'thinca/vim-visualstar'
NeoBundle 'thinca/vim-qfreplace'
NeoBundle 'kana/vim-fakeclip'
NeoBundle 'tpope/vim-surround'
NeoBundle 'tpope/vim-fugitive.git'
" NeoBundle 'bling/vim-airline'
NeoBundle 'Lokaltog/vim-easymotion'
NeoBundle 'vim-scripts/Align.git'
NeoBundle 'adie/BlockDiff'
NeoBundle 'altercation/vim-colors-solarized.git'
NeoBundle 'tyru/open-browser.vim'
NeoBundle 'Sixeight/unite-grep.git'
NeoBundle 'nathanaelkane/vim-indent-guides'
NeoBundle 'derekwyatt/vim-scala'
NeoBundle 'taku-o/vim-copypath'
NeoBundle 'itchyny/calendar.vim'
NeoBundle 'vimwiki'
NeoBundle 'tyru/capture.vim.git'
NeoBundle 't9md/vim-quickhl.git'
NeoBundle 'plasticboy/vim-markdown'
NeoBundle 'kannokanno/previm'
NeoBundle 'fuenor/qfixhowm.git'


call neobundle#end()
" }}}

" {{{ *** プラグイン設定 ***

" ### matchit setting ### {{{
let b:match_words = "if:endif,if:else,(:),{:},[:]"
" }}}

" ### Align setting ### {{{
let g:Align_xstrlen = 3 " for japanese string
let g:DrChipTopLvlMenu = '' " remove 'DrChip' menu
" }}}

" ### vim-quickhl Setting ### {{{
nmap <Space>m <Plug>(quickhl-manual-this)
xmap <Space>m <Plug>(quickhl-manual-this)
nmap <Space>M <Plug>(quickhl-manual-reset)
xmap <Space>M <Plug>(quickhl-manual-reset)
" }}}

" ### fakeclip Setting ### {{{
vmap ,y "*y
nmap ,p "*p
" }}}

" ### neoComplcache Setting ### {{{
"Note: This option must set it in .vimrc(_vimrc).  NOT IN .gvimrc(_gvimrc)!
" Use neocomplcache.
let g:neocomplcache_enable_at_startup = 1
" Use smartcase.
let g:neocomplcache_enable_smart_case = 1
" Set minimum syntax keyword length.
let g:neocomplcache_min_syntax_length = 3
let g:neocomplcache_lock_buffer_name_pattern = '\*ku\*'

" Define keyword.
if !exists('g:neocomplcache_keyword_patterns')
    let g:neocomplcache_keyword_patterns = {}
endif
let g:neocomplcache_keyword_patterns['default'] = '\h\w*'

" Plugin key-mappings.
inoremap <expr><C-g> neocomplcache#undo_completion()
inoremap <expr><C-l> neocomplcache#complete_common_string()

" Recommended key-mappings.
" <CR>: close popup and save indent.
inoremap <silent> <CR> <C-r>=<SID>my_cr_function()<CR>
function! s:my_cr_function()
    return neocomplcache#smart_close_popup() . "\<CR>"
    " For no inserting <CR> key.
    "return pumvisible() ? neocomplcache#close_popup() : "\<CR>"
endfunction
" <TAB>: completion.
inoremap <expr><TAB>  pumvisible() ? "\<C-n>" : "\<TAB>"
" <C-h>, <BS>: close popup and delete backword char.
inoremap <expr><C-h> neocomplcache#smart_close_popup()."\<C-h>"
inoremap <expr><BS> neocomplcache#smart_close_popup()."\<C-h>"
inoremap <expr><C-y>  neocomplcache#close_popup()
inoremap <expr><C-e>  neocomplcache#cancel_popup()
" Close popup by <Space>.
"inoremap <expr><Space> pumvisible() ? neocomplcache#close_popup() : "\<Space>"

" Enable omni completion.
autocmd FileType css setlocal omnifunc=csscomplete#CompleteCSS
autocmd FileType html,markdown setlocal omnifunc=htmlcomplete#CompleteTags
autocmd FileType javascript setlocal omnifunc=javascriptcomplete#CompleteJS
autocmd FileType python setlocal omnifunc=pythoncomplete#Complete
autocmd FileType xml setlocal omnifunc=xmlcomplete#CompleteTags
" 行末のスペースを削除
autocmd Filetype c,cpp,h,java,php,rst autocmd BufWritePre <buffer> :%s/\s\+$//e


" Enable heavy omni completion.
if !exists('g:neocomplcache_omni_patterns')
    let g:neocomplcache_omni_patterns = {}
endif
let g:neocomplcache_omni_patterns.ruby = '[^. *\t]\.\h\w*\|\h\w*::'
let g:neocomplcache_omni_patterns.php  = '[^. \t]->\h\w*\|\h\w*::'
let g:neocomplcache_omni_patterns.c    = '[^.[:digit:] *\t]\%(\.\|->\)'
let g:neocomplcache_omni_patterns.cpp  = '[^.[:digit:] *\t]\%(\.\|->\)\|\h\w*::'


" For perlomni.vim setting.
" https://github.com/c9s/perlomni.vim
let g:neocomplcache_omni_patterns.perl = '\h\w*->\h\w*\|\h\w*::'

" For snippet_complete marker.
if has('conceal')
    set conceallevel=2 concealcursor=i
endif

" }}}

" ### gtags Setting ### {{{
let Gtags_Auto_Map=1
" }}}

" ### vimfiler Setting ### {{{
let g:vimfiler_as_default_explorer=1
" }}}

" ### easy motion setting ### {{{
" ホームポジションに近いキーを使う
let g:EasyMotion_keys='hjklasdfgyuiopqwertnmzxcvbHJKLASDFGYUIOPQWERTNMZXCVB'
" 「'」 + 何かにマッピング
let g:EasyMotion_leader_key="<SPACE>"
" 1 ストローク選択を優先する
let g:EasyMotion_grouping=1
" }}}

" ### indent guides setting ### {{{
let g:indent_guides_enable_on_vim_startup = 0

" 自動カラーを無効にして手動で設定する
let g:indent_guides_auto_colors = 0
" ガイドサイズの設定
let g:indent_guides_guide_size = 1
" }}}

" ### vim-airline ### {{{
let g:airline_left_sep = '»'
let g:airline_right_sep = '«'
let g:airline_linecolumn_prefix = 'L.'
let g:airline#extensions#paste#symbol = 'ρ'
let g:airline#extensions#whitespace#symbol = 'Ξ'
" }}}

" ### quickrun setting ### {{{
let g:quickrun_config = {
            \ "_":{
            \   "runner"                    : "vimproc",
            \   "runner/vimproc/updatetime" : 60,
            \   "hook/time/enable"          : 1,
            \   },
            \ "scala":{
            \   "exec"                      : "%c %s",
            \   },
            \ "markdown":{
            \   "outputter"                 : "browser" ,
            \ }
            \}
" }}}

" ### copy path setting ### {{{
nnoremap <silent> <Space>cp :CopyPath<CR>
nnoremap <silent> <Space>cf :CopyFile<CR>

" }}}

" ### colorscheme ### {{{
set t_Co=256

syntax enable
set background=dark
" colorscheme hybrid

"let g:solarized_termcolors=256
let g:solarized_termtrans=1

colorscheme solarized
call togglebg#map('<F3>')

" }}}

" ### open-browser.vim ### {{{
nmap <Leader>w <Plug>(openbrowser-open)
vmap <Leader>w <Plug>(openbrowser-open)

" }}}

" ### qfixhowm.vim ### {{{
" ファイルタイプをmarkdownにする
let QFixHowm_FileType = 'markdown'

" タイトル記号
let QFixHowm_Title = '#'

" qfixappにruntimepathを通す(パスは環境に合わせてください)
set runtimepath+=~/path/to/qfixapp

" キーマップリーダー
let QFixHowm_Key = 'g'

" howm_dirはファイルを保存したいディレクトリを設定
let howm_filename        = '%Y/%m/%Y-%m-%d-%H%M%S.mkd'
let howm_fileencoding    = 'utf-8'
let howm_fileformat      = 'unix'

" }}}
" }}}

" {{{ *** 個人設定 ***

au BufRead,BufNewFile,BufReadPost *.ino,*.pde set filetype=cpp

" Auto open cw.
augroup grepopen
    autocmd!
    autocmd QuickfixCmdPost vimgrep cw
    autocmd QuickfixCmdPost grep cw
augroup END

" Setting Key mapping
nnoremap qqq: <Esc>q:
nnoremap qqq/ <Esc>q/
nnoremap qqq? <Esc>q?
" Disable key ( q:, q/, q? )
nnoremap q: <Nop>
nnoremap q/ <Nop>
nnoremap q? <Nop>

" Change directory that file opend
nnoremap <silent> <Space>cd :cd %:h<CR>

" move to center, when input parenthesis
inoremap {}<Space> {}<LEFT>
inoremap []<Space> []<LEFT>
inoremap ()<Space> ()<LEFT>
inoremap ""<Space> ""<LEFT>
inoremap ''<Space> ''<LEFT>
inoremap <><Space> <><LEFT>

" move cursor when it's insert mode
inoremap <C-h> <Left>
inoremap <C-j> <Down>
inoremap <C-k> <Up>
inoremap <C-l> <Right>

inoremap {}<Space><CR> {<CR>}<UP><CR>

" Input date
nmap <Space>id <ESC>i<C-R>=strftime("[%Y/%m/%d (%a) %H:%M]")<CR><CR>

" move separator
nnoremap <C-l> <C-w>><CR><UP>
nnoremap <C-h> <C-w><<CR><UP>
nnoremap <C-j> <C-w>-<CR><UP>
nnoremap <C-k> <C-w>+<CR><UP>

" ペーストした範囲を一発で選択する
nnoremap <expr> gp '`[' . strpart(getregtype(), 0, 1) . '`]'

" ESCの連打で検索結果ハイライトをリセット
nnoremap <ESC><ESC> :nohlsearch<CR>

" ペースト
vnoremap <silent> <C-p> "0p

let s:addCentering = 1
nnoremap <silent><Space>zz :call ToggleCentering()<CR>
function! ToggleCentering()
    if s:addCentering == 1
        let s:addCentering = 0
        nmap n  nzz
        nmap N  Nzz
        nmap *  *zz
        nmap #  #zz
        nmap g* g*zz
        nmap g# g#zz
        nmap G  Gzz
    else
        let s:addCentering = 1
        nmap n  n
        nmap N  N
        nmap *  *
        nmap #  #
        nmap g* g*
        nmap g# g#
        nmap G  G
    endif
endfunction

" highlight ZenkakuSpace {{{
if has('syntax')
    augroup ErrorMsg
        autocmd!
        autocmd VimEnter,WinEnter * match ErrorMsg /　/
    augroup END
endif
" }}}

" }}}


