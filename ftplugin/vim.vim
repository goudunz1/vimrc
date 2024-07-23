let b:comment_string='"'
setlocal foldmethod=marker

" load .vimrc and plugins
nnoremap <leader><leader>s :source <c-r>=expand('%:p')<cr><cr>
nnoremap <leader><leader>i :PlugInstall<cr>
nnoremap <leader><leader>c :PlugClean<cr>

