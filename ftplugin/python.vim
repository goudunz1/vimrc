let b:comment_string='#'

function! s:exec_as_python(str)
    let temp=tempname()
    let content=["#!/usr/bin/env python"]+split(a:str,'\n')
    call writefile(content, temp)
    call setfperm(temp,"rwxrwxrwx")
    exe ":!".temp
endfunction

nnoremap <silent><buffer> <leader><cr> :!/usr/bin/env python <c-r>=expand("%")<cr><cr>
nnoremap <silent><buffer> <leader>x 0v$"+y:call <sid>exec_as_python(getreg('+'))<cr>
xnoremap <silent><buffer> <leader>x "+y:call <sid>exec_as_python(getreg('+'))<cr>

function! s:init_code()
    call append(line(".")-1,'#!/usr/bin/env python')
    call append(line(".")-1,'# Encoding=utf-8')
    call append(line(".")-1,'# Author '.g:author)
    call append(line(".")-1,'# Email '.g:email)
    call append(line(".")-1,'# Update '.strftime("%Y-%m-%d %H:%M:%S"))
    call append(line(".")-1,'# Description ')
    call append(line(".")-1,'# Example ')
endfunction

nnoremap <silent><buffer> <leader>/ :call <sid>init_code()<cr>

