" ==============================================================================
"  __  __      _____ __                    _      
"  \ \/ /_  __/ ___// /_  ___  ____  ____ ( )_____
"   \  / / / /\__ \/ __ \/ _ \/ __ \/ __ `/// ___/
"   / / /_/ /___/ / / / /  __/ / / / /_/ / (__  ) 
"  /_/\__,_//____/_/ /_/\___/_/ /_/\__, / /____/  
"                                 /____/          
"          _                    
"   _   __(_)___ ___  __________
"  | | / / / __ `__ \/ ___/ ___/
"  | |/ / / / / / / / /  / /__  
"  |___/_/_/ /_/ /_/_/   \___/  
"                               
" ==============================================================================

" ==============================================================================
" File: vimrc
" Author: Yu Sheng(goudunz1)
" Email: goudunz1@outlook.com
" Inspired by chenxuan's vimrc
" https://github.com/chenxuan520/vim-fast
" signature

let g:author="Yu Sheng(goudunz1)"
let g:email="goudunz1@outlook.com"

" ==============================================================================

" ==============================================================================
" [vim options] {{{

let mapleader=","               " use ',' as leader key
set nocompatible                " disable legacy mode(vi)
filetype plugin indent on       " enable plugin and indent based on file types
syntax on                       " enable built-in highlight
set t_Co=256                    " require terminal to use 256 colors
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
set colorcolumn=80              " 80 characters warning line

set autoindent                  " auto indent according to the previous line
set cindent                     " turn on indent for c-like languages
set cinoptions=g0,:0,N-s,E-s,(0 " see :help cinoptions
set smartindent                 " smartly choose indent way
set expandtab                   " soft tabs instead of tabs
set shiftwidth=4                " use 4 spaces for auto shift
set tabstop=4                   " set width of tab to 4
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

packadd! matchit                " better % support
packadd! termdebug              " gdb support
let g:termdebug_wide=1          " vertical split gdb windows

" }}}
" ==============================================================================

" ==============================================================================
" [user scripts] {{{

" define actions upon buffer entering and leaving
augroup Buffer
    autocmd!
    " remember the last position when re-opening a buffer
    autocmd BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exec "normal! g'\"" | endif
    " set cursor line 
    autocmd BufEnter,WinEnter * setlocal cursorline
    autocmd BufLeave,WinLeave * setlocal nocursorline
augroup END

" run async tasks with 'vert term'
command! -complete=shellcmd -nargs=+ AsyncRun exec "vert term ".<q-args>

" set file indent
function! g:SetIndent(type, width)
    if a:type=="tab"
        setlocal noexpandtab
    else
        setlocal expandtab
    endif
    exec "setlocal shiftwidth=".a:width
    exec "setlocal tabstop=".a:width
    exec "setlocal softtabstop=".a:width
endfunction

" hold <space> to add more space
function! g:AddSpace()
    exec "normal! i "
    let ch = nr2char(getchar())
    redraw
    while ch == ' '
        exec "normal! i "
        let ch = nr2char(getchar())
        redraw
    endwhile
    call feedkeys(ch, 'i')
endfunction

" get selected area to register @s under visual/select mode
function g:GetSelectedArea()
	normal! gv"sy
	return @s
endfunction

" for more user scripts see autoload/*.vim

" autoload/hexedit.vim
command! -nargs=0 HexEdit :call hexedit#begin()
command! -nargs=0 NoHexEdit :call hexedit#stop()

" autoload/scroll.vim
nnoremap <silent> <c-u> :call scroll#up(&scroll, 16.67, 2)<cr>
nnoremap <silent> <c-d> :call scroll#down(&scroll, 16.67, 2)<cr>
nnoremap <silent> <c-b> :call scroll#up(&scroll*2, 16.67, 4)<cr>
nnoremap <silent> <c-f> :call scroll#down(&scroll*2, 16.67, 4)<cr>

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

" for more file type associated scripts see ftplugin/*.vim

" }}}
" ==============================================================================

" ==============================================================================
" [key mappings] {{{

" name & email abbreviation
iabbrev <expr> @@n g:author
iabbrev <expr> @@e g:email

" leave current buffer
nnoremap <silent><expr> <leader>q bufname() == '' ? ":q!<cr>" : &bt == '' ? ":bd<cr>" : ":close<cr>"
" select previous buffer
nnoremap <silent> <leader>k :if &bt == ''<bar>bp<bar>while &bt != ''<bar>bp<bar>endwhile<bar>endif<cr>
" select next buffer
nnoremap <silent> <leader>j :if &bt == ''<bar>bn<bar>while &bt != ''<bar>bn<bar>endwhile<bar>endif<cr>
" edit file in new buffer
nnoremap <leader>e :edit<space><c-r>=getcwd()<cr>/
nnoremap <leader>E :edit<space>/
" reload/redraw
nnoremap <silent> <leader>r :e<cr>
nnoremap <silent> <leader>R :redraw!<cr>

" force write (require sudo)
cabbrev w!! w !sudo tee % >/dev/null
" quick write
nnoremap <leader>w :w!<cr>
vnoremap <leader>w :w!<cr>
nnoremap <leader>W :w!!<cr>
vnoremap <leader>W :w!!<cr>

" torture myself :)
nnoremap <up> <nop>
nnoremap <down> <nop>
nnoremap <left> <nop>
nnoremap <right> <nop>

" yank from system clipboard
nnoremap <leader>y "+y
vnoremap <leader>y "+y
" paste to system clipboard
nnoremap <leader>p "+p
nnoremap <leader>P "+P
vnoremap <leader>p "+p
vnoremap <leader>P "+P

" shortcut for tab shift
nnoremap <tab> >>
nnoremap <s-tab> <<
vnoremap <tab> >
vnoremap <s-tab> <

" open a new empty tab
nnoremap <silent> <leader><tab> :tabnew<cr>
nnoremap <silent> <leader><bs> :tabclose<cr>
" open a new empty window
nnoremap <silent> <leader>v :vert new<cr>
nnoremap <silent> <leader>V :new<cr>
" adjust window boundary
nnoremap <c-up> <c-w>+
nnoremap <c-down> <c-w>-
nnoremap <c-left> <c-w><
nnoremap <c-right> <c-w>>
" change focused window
nnoremap <s-up> <c-w>k
nnoremap <s-down> <c-w>j
nnoremap <s-left> <c-w>h
nnoremap <s-right> <c-w>l

" open up a terminal on the right
nnoremap <silent> <leader>t :vert term<cr>
" open up a terminal at the bottom
nnoremap <silent> <leader>T :bo term ++rows=6<cr>
" open up a terminal in a new tab
nnoremap <silent> <leader><leader>t :tabe<cr>:vert term ++curwin ++close<cr>
" open up a terminal in a new tab under directory of current file (changes the
" register @s)
nnoremap <silent> <leader><leader>T :let @s=expand('%:p:h')<cr>:tabe<cr>:call term_start("bash",{"cwd":"<c-r>=@s<cr>","curwin":1,"term_finish":"close"})<cr>

" open up a vimdiff window
nnoremap <leader><leader>v :vert diffsplit <c-r>=expand("%")<cr>

" run marco in visual mode
xnoremap @ :normal! @
" selected move
xnoremap <silent> <up> :move '<-2<cr>gv
xnoremap <silent> <down> :move '>+1<cr>gv
xnoremap <silent> <right> y<c-w>lo<c-[>Vpgv
xnoremap <silent> <left> y<c-w>ho<c-[>Vpgv
xnoremap <silent> <c-k> :move '<-2<cr>gv
xnoremap <silent> <c-j> :move '>+1<cr>gv
xnoremap <silent> <c-l> y<c-w>lo<c-[>Vpgv
xnoremap <silent> <c-h> y<c-w>ho<c-[>Vpgv
" substitute selected keyword (register @s will be used!)
xnoremap g/ "sy/\V\<<c-r>=@s<cr>\><cr><c-o>
xnoremap gs "sy/\V\<<c-r>=@s<cr>\><cr><c-o>:%s/\V\<<c-r>=@s<cr>\>/

" erase trailing spaces
nnoremap <silent> d<space> :s/\s*$//<cr>:noh<cr><c-o>
nnoremap <silent> d<bs> :%s/\s*$//<cr>:noh<cr><c-o>
" erase empty lines
nnoremap <silent> d<cr> :g/^\s*$/d<cr>:noh<cr>
" replace line with a new one
nnoremap dc d0d$

" clear pattern highlight
nnoremap <silent> <leader>h :noh<cr>
vnoremap <silent> <leader>h :noh<cr>

" show hidden characters
nnoremap <silent> <leader>l :let &l:list=!&l:list<cr>
vnoremap <silent> <leader>l :let &l:list=!&l:list<cr>

" tcsh-style command line (bash compatible)
cnoremap <c-a> <home>
cnoremap <c-b> <left>
cnoremap <c-f> <right>

" quickfix window
nnoremap ]q :cnext<cr>
nnoremap [q :cprevious<cr>
nnoremap \q :cclose<cr>
nnoremap =q :copen<cr>

" press <leader>, then hold <space> to shift
nnoremap <silent> <leader><space> :call AddSpace()<cr>

" key bindings for termdebug
nnoremap <f5> :Termdebug<space>
nnoremap <f6> :Break<cr>
nnoremap <f7> :Over<cr>
nnoremap <f8> :Step<cr>

" }}}
" ==============================================================================

" ==============================================================================
" [plugin list] (managed by vim-plug) {{{

call plug#begin('~/.vim/plugged')

" onedark theme
Plug 'joshdick/onedark.vim'

" navigation tree on the left
Plug 'preservim/nerdtree'

" auto pair parentheses or special keys
Plug 'jiangmiao/auto-pairs'

" auto code align
Plug 'godlygeek/tabular'

" fancy start menu
Plug 'mhinz/vim-startify'

" LSP auto completion
Plug 'neoclide/coc.nvim', {'branch': 'release'}

call plug#end()

" }}}
" ==============================================================================

" ==============================================================================
" [plugin settings] {{{

" onedark.vim
colorscheme onedark

" nerdtree
let g:NERDTreeWinSize=24
let g:NERDTreeDirArrowExpandable='+'
let g:NERDTreeDirArrowCollapsible='-'
nnoremap <silent> <leader>n :NERDTreeToggle<cr>
" exit vim if NERDTree is the only window remaining
augroup NERDTree
    autocmd!
    autocmd BufEnter * if winnr('$')==1&&exists('b:NERDTree')&&b:NERDTree.isTabTree()|:bn|endif
augroup END

" auto-pairs
let g:AutoPairsMapCh=0
let g:AutoPairsMapBS=0
augroup AutoPairs
    autocmd!
    autocmd FileType php let b:AutoPairs=AutoPairsDefine({'<?':'?>','<?php':'?>'})
    autocmd FileType rust let b:AutoPairs=AutoPairsDefine({'\w\zs<':'>'})
    autocmd FileType html let b:AutoPairs=AutoPairsDefine({'<':'>','<!--':'-->'})
augroup END

" tabular
nnoremap <leader>/ :Tabularize /
xnoremap <leader>/ :Tabularize /

" vim-startify
let g:ascii=[
            \'  __  __      _____ __                    _      ',
            \'  \ \/ /_  __/ ___// /_  ___  ____  ____ ( )_____',
            \'   \  / / / /\__ \/ __ \/ _ \/ __ \/ __ `/// ___/',
            \'   / / /_/ /___/ / / / /  __/ / / / /_/ / (__  ) ',
            \'  /_/\__,_//____/_/ /_/\___/_/ /_/\__, / /____/  ',
            \'                                 /____/          ',
            \'          _                                      ',
            \'   _   __(_)___ ___  __________                  ',
            \'  | | / / / __ `__ \/ ___/ ___/                  ',
            \'  | |/ / / / / / / / /  / /__                    ',
            \'  |___/_/_/ /_/ /_/_/   \___/                    ',
            \'                                                 ',
            \]
let g:startify_custom_header="startify#pad(g:ascii+startify#fortune#boxed())"
let g:startify_lists=[
            \{'type':'files','header':startify#pad(['Recent Files'])},
            \{'type':'dir','header':startify#pad(['Recommended Files'])},
            \]
let g:startify_files_number=5
nnoremap <leader>b :Startify<cr>
xnoremap <leader>b :Startify<cr>

" coc.nvim

" }}}
" ==============================================================================
