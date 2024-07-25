" ==============================================================================
" This script provides binary editing features
" Example: command! -nargs=0 Hexedit :call hexedit#begin()
"          command! -nargs=0 NoHexedit :call hexedit#stop()
" ==============================================================================

" add xxd arguments here
let s:xxdcmd = ":%!xxd"
" reverse hex dump
let s:xxdrcmd = ":%!xxd -r"

function hexedit#begin() abort
	if !executable('xxd')
        echoerr "xxd not found in your $PATH"
        return
    endif

    setlocal bin
    setlocal filetype=
    silent! exec s:xxdcmd
    redraw!

	augroup Hexedit
		autocmd!
        autocmd BufReadPost <buffer> setlocal filetype= | silent! exec s:xxdcmd | redraw!
		autocmd BufWritePre <buffer> let s:savedpos = getcurpos() | silent! exec s:xxdrcmd
		autocmd BufWritePost <buffer> silent! exec s:xxdcmd | call cursor([s:savedpos[1], s:savedpos[2]])
		autocmd BufDelete <buffer> setlocal nobin | autocmd! Hexedit
	augroup END
endfunction

function hexedit#stop() abort
    setlocal nobin
    autocmd! Hexedit
    exec ":e"
endfunction
