" ==============================================================================
"                         _                __ _     
"                        | |              /_ ( )    
"    __ _  ___  _   _  __| |_   _ _ __  ___| |/ ___ 
"   / _` |/ _ \| | | |/ _` | | | | '_ \|_  / | / __|
"  | (_| | (_) | |_| | (_| | |_| | | | |/ /| | \__ \
"   \__, |\___/ \__,_|\__,_|\__,_|_| |_/___|_| |___/
"    __/ (_)                                        
"  _|___/__ _ __ ___  _ __ ___                      
"  \ \ / / | '_ ` _ \| '__/ __|                     
"   \ V /| | | | | | | | | (__                      
"    \_/ |_|_| |_| |_|_|  \___|                     
"
" ==============================================================================

" ==============================================================================
" author Yu Sheng(goudunz1)
" email  goudunz1@outlook.com
" inspired by chenxuan's vimrc
" https://github.com/chenxuan520/vim-fast
" ==============================================================================

" ==============================================================================
" [vim options] {{{

let mapleader=","               " use ',' as leader key
set nocompatible                " disable legacy mode(vi)
filetype plugin indent on       " enable plugin and indent based on file types
syntax on                       " enable built-in highlight
set noerrorbells                " turn off error bells
set visualbell t_vb=            " turn off visual beeping
set cmdheight=1                 " height of the cmd line
set showcmd                     " show input in the cmd line
set textwidth=0                 " disable auto <cr>
set ruler                       " show cursor position in status line
set laststatus=2                " show status line
set number                      " show line numbers
set relativenumber              " show relative line numbers
set whichwrap+=<,>,h,l          " cursor key can cross rows
set matchpairs+=<:>             " % can now detect <>
set backspace=indent,eol,start  " delete special characters freely
set virtualedit=block           " virtual select inside a tab
set showtabline=2               " show tab menu
set splitbelow                  " split new window below
set splitright                  " split new vertical window right
set mouse=a                     " enable mouse
set clipboard=unnamed           " host clipboard (require gvim)
set wildmenu                    " better command auto completion
colorscheme onedark             " color theme
set colorcolumn=80              " 80 characters warning line

set autoindent                  " auto indent according to the previous line
set cindent                     " turn on indent for c-like languages
set cinoptions=g0,:0,N-s,E-s,(0 " see :help cinoptions
set smartindent                 " smartly choose indent way
set expandtab                   " soft tabs instead of tabs
set shiftwidth=4                " use 4 spaces for auto shift
set softtabstop=4               " use 4 spaces for a soft tab
set smarttab                    " smartly shift with tabs and spaces

set nowrap                      " disable line wrap if cursor too right
set sidescroll=1                " set number of columns to move if cursor too right
set sidescrolloff=4             " keep 4 visible column on the right
set scrolloff=4                 " keep 4 visible line at the bottom

set hlsearch                    " highlight the pattern
set incsearch                   " highlight the pattern when typing
set ignorecase                  " ignore search case
set smartcase                   " smartly ignore search case
set wrapscan                    " searches wrap over EOF

set nobackup                    " disable backup file
set noswapfile                  " disable swap file
set autoread                    " auto load buffer if file changed
set confirm                     " raise a dialog when saving

" }}}
" ==============================================================================

" ==============================================================================
" [user scripts] {{{

" signature
let g:author="Yu Sheng(goudunz1)"
let g:email="goudunz1@outlook.com"

" quick author & email
iabbrev @@n Yu Sheng(goudunz1)
iabbrev @@e goudunz1@outlook.com

" force write
cabbrev w!! w !sudo tee % >/dev/null

" quick write
nnoremap <leader>w :w<cr>
vnoremap <leader>w :w<cr>

" quick quit
nnoremap <leader>q :q<cr>
vnoremap <leader>q :q<cr>

" torture myself :)
nnoremap <up> <nop>
nnoremap <down> <nop>
nnoremap <left> <nop>
nnoremap <right> <nop>

" yank from system clipboard
vnoremap <leader>y "+y
nnoremap <leader>y "+y

" paste to system clipboard
vnoremap <leader>p "+p
nnoremap <leader>p "+p
vnoremap <leader>P "+P
nnoremap <leader>P "+P

" shortcut for tab shift
vnoremap <tab> >
vnoremap <s-tab> <
nnoremap <tab> >>
nnoremap <s-tab> <<

" erase trailing spaces
nnoremap <silent> d<space> :s/\s*$//<cr>:noh<cr><c-o>
nnoremap <silent> d<bs> :%s/\s*$//<cr>:noh<cr><c-o>

" erase empty lines
nnoremap <silent> d<cr> :g/^\s*$/d<cr>:noh<cr>

" change window boundary
nnoremap <c-up> <c-w>+
nnoremap <c-down> <c-w>-
nnoremap <c-left> <c-w><
nnoremap <c-right> <c-w>>

" change current window
nnoremap <s-up> <c-w>k
nnoremap <s-down> <c-w>j
nnoremap <s-left> <c-w>h
nnoremap <s-right> <c-w>l

" clear pattern highlight
nnoremap <leader>h :noh<cr>

" show hidden characters
vnoremap <silent> <leader>l :let &l:list=!&l:list<cr>
nnoremap <silent> <leader>l :let &l:list=!&l:list<cr>

" open a new tab
nnoremap <leader><tab> :tabnew<cr>
nnoremap <leader><bs> :tabclose<cr>

" switch between buffers
nnoremap <c-p> :bp<cr>
nnoremap <c-n> :bn<cr>
nnoremap <leader>d :bd<cr>

" run marco in visual mode
xnoremap @ :normal! @

" substitute selected (register s will be used!)
xnoremap g/ "sy/\V<c-r>=@s<cr><cr>
xnoremap gs "sy/\V<c-r>=@s<cr><cr>:%s/\V<c-r>=@s<cr>/

" add empty line
nnoremap <silent> <leader>O :call append(line('.')-1,"")<cr>
nnoremap <silent> <leader>o :call append(line('.'),"")<cr>

" selected move
xnoremap <silent> <up> :move '<-2<cr>gv
xnoremap <silent> <down> :move '>+1<cr>gv
xnoremap <silent> <right> y<c-w>lo<c-[>Vpgv
xnoremap <silent> <left> y<c-w>ho<c-[>Vpgv
xnoremap <silent> <c-k> :move '<-2<cr>gv
xnoremap <silent> <c-j> :move '>+1<cr>gv
xnoremap <silent> <c-l> y<c-w>lo<c-[>Vpgv
xnoremap <silent> <c-h> y<c-w>ho<c-[>Vpgv

" vertical split on the right side
nnoremap <leader>v :vsp<cr>:bn<cr>

" edit file in new buffer
nnoremap <leader>e :edit<space><c-r>=getcwd()<cr>/
nnoremap <leader>E :edit<space>~/

" remember the last position when re-opening a buffer
autocmd BufReadPost * if line("'\"")>1&&line("'\"")<=line("$")|exec "normal! g'\""|endif

" set cursor line 
autocmd WinEnter,BufWinEnter * setlocal cursorline
autocmd WinLeave,BufWinLeave * setlocal nocursorline

" open up a terminal on the right side
command! -complete=shellcmd -nargs=+ Shell exec "vertical terminal ".<q-args>
nnoremap <silent> <leader>t :vertical terminal
xnoremap <silent> <leader>t :vertical terminal

" reload/redraw
command! -nargs=0 -bang Reload exec ":edit ".expand("%")
nnoremap <silent> <leader>r :redraw!<cr>
nnoremap <silent> <leader>R :Reload!<cr>

" autoload/scroll.vim
noremap <silent> <c-u> :call scroll#up(&scroll, 16.67, 2)<cr>
noremap <silent> <c-d> :call scroll#down(&scroll, 16.67, 2)<cr>
noremap <silent> <c-b> :call scroll#up(&scroll*2, 16.67, 4)<cr>
noremap <silent> <c-f> :call scroll#down(&scroll*2, 16.67, 4)<cr>

" autoload/cmdline.vim
cnoremap <expr> ( cmdline#auto_pair('(', 'pars')
cnoremap <expr> ) cmdline#auto_pair(')', 'pars')
cnoremap <expr> [ cmdline#auto_pair('[', 'pars')
cnoremap <expr> ] cmdline#auto_pair(']', 'pars')
cnoremap <expr> { cmdline#auto_pair('{', 'pars')
cnoremap <expr> } cmdline#auto_pair('}', 'pars')
cnoremap <expr> < cmdline#auto_pair('<', 'pars')
cnoremap <expr> > cmdline#auto_pair('>', 'pars')
cnoremap <expr> " cmdline#auto_pair('"', "quotes")
cnoremap <expr> ' cmdline#auto_pair("'", "quotes")
cnoremap <expr> ` cmdline#auto_pair("`", "quotes")
cnoremap <expr> <bs> cmdline#auto_pair("\<bs>", 'bs')

" tcsh-style command line(bash compatible)
cnoremap <c-a> <home>
cnoremap <c-b> <left>
cnoremap <c-f> <right>

" }}}
" ==============================================================================

" ==============================================================================
" [plugin list] (managed by vim-plug) {{{

call plug#begin('~/.vim/plugged')

" navigation tree on the left
Plug 'preservim/nerdtree'

" auto pair parentheses or special keys
Plug 'jiangmiao/auto-pairs'

" auto code align
Plug 'godlygeek/tabular'

call plug#end()

" }}}
" ==============================================================================

" ==============================================================================
" [plugin settings] {{{

" nerdtree
let g:NERDTreeFileExtensionHighlightFullName = 1
let g:NERDTreeExactMatchHighlightFullName = 1
let g:NERDTreePatternMatchHighlightFullName = 1
let g:NERDTreeHighlightFolders = 1
let g:NERDTreeHighlightFoldersFullName = 1
let g:NERDTreeDirArrowExpandable='+'
let g:NERDTreeDirArrowCollapsible='-'
let g:NERDTreeWinSize=24
nnoremap <silent> <leader>n :NERDTreeToggle<cr>
" exit vim if NERDTree is the only window remaining
augroup augroup_nerdtree
    autocmd!
    autocmd BufEnter * if winnr('$')==1&&exists('b:NERDTree')&&b:NERDTree.isTabTree()|:bn|endif
augroup END

" auto-pairs
let g:AutoPairsMapCh=0
let g:AutoPairsMapBS=0
augroup augroup_autopairs
    autocmd!
    autocmd FileType php let b:AutoPairs=AutoPairsDefine({'<?':'?>','<?php':'?>'})
    autocmd FileType rust let b:AutoPairs=AutoPairsDefine({'\w\zs<':'>'})
    autocmd FileType html let b:AutoPairs=AutoPairsDefine({'<':'>','<!--':'-->'})
augroup END

" tabular
nnoremap <leader><space> :Tabularize /
xnoremap <leader><space> :Tabularize /

" }}}
" ==============================================================================

