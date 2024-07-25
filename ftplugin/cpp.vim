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
        let name=&filetype=='cpp'?root.'.cpp':root.'.c'
    elseif extension=='cpp'||extension=='c'
        let name=&filetype=='cpp'?root.'.hpp':root.'.h'
    endif
    let @s=name
endfunction

function! s:init_code()
    call append(line(".")-1,'// File: '.expand('%'))
    call append(line(".")-1,'// Author: '.g:author)
    call append(line(".")-1,'// Email: '.g:email)
    call append(line(".")-1,'// Update: '.strftime("%Y-%m-%d %H:%M:%S"))
    call append(line(".")-1,'// Description: ')
    call append(line(".")-1,'// Example: ')
endfunction

nnoremap <silent><buffer> <leader>x :call <sid>switch_cpp_hpp()<cr>:e <c-r>=@s<cr><cr>
nnoremap <silent><buffer> <leader>/ :call <sid>init_code()<cr>
