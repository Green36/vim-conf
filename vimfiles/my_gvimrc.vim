
" Make command line two lines high
set ch=2

" Make shift-insert work like in Xterm
map  <S-Insert> <MiddleMouse>
map! <S-Insert> <MiddleMouse>

" I like highlighting strings inside C comments
let c_comment_strings=1

" Switch on syntax highlighting if it wasn't on yet.
if !exists("syntax_on")
    syntax on
endif

" Switch on search pattern highlighting.
set hlsearch

" フォント設定:
set encoding=utf-8
if has('win32')
    " Windows用
    set guifont=MS_Gothic:h16:cSHIFTJIS
    "  set guifont=MeiryoKe_Console:h16:cSHIFTJIS
    " 行間隔の設定
    set linespace=1
    " 一部のUCS文字の幅を自動計測して決める
    if has('kaoriya')
        set ambiwidth=auto
    endif
elseif has('mac')
    set guifont=Osaka－等幅:h14
elseif has('xfontset')
    " UNIX用 (xfontsetを使用)
    set guifontset=a14,r14,k14
endif
" 印刷用フォント
if has('printer')
    if has('win32')
        set printfont=MS_Mincho:h12:cSHIFTJIS
        "set printfont=MS_Gothic:h12:cSHIFTJIS
    endif
endif


set listchars=tab:▸\ ,trail:_,nbsp:%,extends:>,precedes:<,eol:¬

" ウインドウの幅
set columns=80
" ウインドウの高さ
set lines=25
" コマンドラインの高さ(GUI使用時)
set cmdheight=2

" 日本語入力に関する設定:
if has('multi_byte_ime') || has('xim')
    " 挿入モード・検索モードでのデフォルトのIME状態設定
    set iminsert=0 imsearch=0
    " 挿入モードでのIME状態を記憶させない
    inoremap <silent> <ESC> <ESC>:set iminsert=0<CR>
endif


" どのモードでもマウスを使えるようにする
set mouse=a
" マウスの移動でフォーカスを自動的に切替えない (mousefocus:切替る)
set nomousefocus
" 入力時にマウスポインタを隠す (nomousehide:隠さない)
set mousehide
" ビジュアル選択(D&D他)を自動的にクリップボードへ (:help guioptions_a)
set guioptions+=a



" ### default ###
" disp number of line
set nocompatible
set number

au GUIEnter * simalt ~x

" fullscreen
"-----------------------------------------------------------
nnoremap <F11> :call ToggleFullScreen()<CR>
function! ToggleFullScreen()
    if &guioptions =~# 'C'
        set guioptions-=C
        if exists('s:go_temp')
            if s:go_temp =~# 'm'
                set guioptions+=m
            endif
            if s:go_temp =~# 'T'
                set guioptions+=T
            endif
        endif
        simalt ~r
        set columns=80
        set lines=25
    else
        let s:go_temp = &guioptions
        set guioptions+=C
        set guioptions-=m
        set guioptions-=T
        simalt ~x
    endif
endfunction

if has('vim_starting')
    call ToggleFullScreen()
endif

nnoremap <F12> :set guifont=*<CR>

