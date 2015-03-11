
let s:addzt = 0
let s:addzz = 0
let s:addzb = 0

function! s:ResetFlgZx()
   let s:addzt = 0
   let s:addzz = 0
   let s:addzb = 0
endfunction

function! ToggleAddzt()
    if s:addzt == 0
        call s:EnableAddzt()
        call s:ResetFlgZx()
        let s:addzt = 1
    else
        call s:DisableAddzx()
        call s:ResetFlgZx()
    endif
endfunction

function! ToggleAddzz()
    if s:addzz == 0
        call s:EnableAddzz()
        call s:ResetFlgZx()
        let s:addzz = 1
    else
        call s:DisableAddzx()
        call s:ResetFlgZx()
    endif
endfunction

function! ToggleAddzb()
    if s:addzb == 0
        call s:EnableAddzb()
        call s:ResetFlgZx()
        let s:addzb = 1
    else
        call s:DisableAddzx()
        call s:ResetFlgZx()
    endif
endfunction

function! s:EnableAddzt()
    nmap n  nzt
    nmap N  Nzt
    nmap *  *zt
    nmap #  #zt
    nmap g* g*zt
    nmap g# g#zt
    nmap G  Gzt
endfunction

function! s:EnableAddzz()
    nmap n  nzt
    nmap n  nzz
    nmap N  Nzz
    nmap *  *zz
    nmap #  #zz
    nmap g* g*zz
    nmap g# g#zz
    nmap G  Gzz
endfunction

function! s:EnableAddzb()
    nmap n  nzb
    nmap N  Nzb
    nmap *  *zb
    nmap #  #zb
    nmap g* g*zb
    nmap g# g#zb
    nmap G  Gzb
endfunction

function! s:DisableAddzx()
    nmap n  n
    nmap N  N
    nmap *  *
    nmap #  #
    nmap g* g*
    nmap g# g#
    nmap G  G
endfunction


