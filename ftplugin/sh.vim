let b:comment_string='#'

function! s:exec_as_sh(str)
    let temp=tempname()
    let content=["#!/bin/sh"]+split(a:str,'\n')
    call writefile(content, temp)
    call setfperm(temp,"rwxrwxrwx")
    exec ":!".temp
endfunction

nnoremap <silent><buffer> <leader><cr> :!<c-r>=expand("%")<cr><cr>
nnoremap <silent><buffer> <leader>x 0v$"+y:!<c-r>=@+<cr><cr>
xnoremap <silent><buffer> <leader>x "+y:call <sid>exec_as_sh(getreg('+'))<cr>

function! s:init_code()
    call append(line(".")-1,'#!/bin/bash')
    augroup shmode
        autocmd!
        autocmd! BufWritePost *.sh call setfperm(expand('%'),'rwxrwxr-x')
        autocmd! BufDelete *.sh autocmd! shmode|augroup! shmode
    augroup END
endfunction

nnoremap <silent><buffer> <leader>/ :call <sid>init_code()<cr>

