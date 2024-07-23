setlocal tabstop=2
setlocal shiftwidth=2
setlocal softtabstop=2

let b:comment_string="//"

" compiler options for test
let b:compiler=&filetype=="c"?"gcc":"g++"
let &l:makeprg=b:compiler." -O2 -Werror -gdwarf-4 % -o $*"

" Switch between cpp and its hpp counterpart
function s:switch_cpp_hpp()
    let name=expand("%")
    let root=expand("%:r")
    let extension=expand("%:e")

    if extension=='hpp'||extension=='h'
        if &filetype=='cpp'
            let name=filereadable(root.'.cpp')?root.'.cpp':root.'.c'
        else
            let name=filereadable(root.'.c')?root.'.c':root.'.cpp'
        endif
    elseif extension=='cpp'||extension=='c'
        if &filetype=='cpp'
            let name=filereadable(root.'.hpp')?root.'.hpp':root.'.h'
        else
            let name=filereadable(root.'.h')?root.'.h':root.'.hpp'
        endif
    endif

    let @s=name
endfunction

" A better <cr> that smartly insert semicolon for you
" You should use it in insert mode
function! s:cpp_enter()
    let s:str=getline('.')
    let s:col=col('.')-2
    while s:str[s:col]==' '||s:str[s:col]==nr2char(9)
        let s:col-=1
        if s:col<=0
            break
        endif
    endwhile
    if s:col<=0
        return "\<cr>"
    endif
    if s:str[s:col]=='{'||s:str[s:col]==';'||s:str[s:col]=='>'||s:str[0]=='#'
        return "\<cr>"
    endif
    return ";\<cr>"
endfunction

function! s:init_code()
    call append(line(".")-1,'// Author '.g:author)
    call append(line(".")-1,'// Email '.g:email)
    call append(line(".")-1,'// Update '.strftime("%Y-%m-%d %H:%M:%S"))
    call append(line(".")-1,'// Description ')
    call append(line(".")-1,'// Example ')
endfunction

nnoremap <silent><buffer> <leader>x :call <sid>switch_cpp_hpp()<cr>:e <c-r>=@s<cr><cr>
inoremap <silent><buffer><expr> <cr> <sid>cpp_enter()
nnoremap <silent><buffer> <leader>/ :call <sid>init_code()<cr>

