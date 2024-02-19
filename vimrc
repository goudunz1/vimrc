try
  "colorscheme blue
  "colorscheme darkblue
  colorscheme default
  "colorscheme delek
  "colorscheme desert
  "colorscheme elflord
  "colorscheme evening
  "colorscheme habamax
  "colorscheme industry
  "colorscheme koehler
  "colorscheme lunaperche
  "colorscheme morning
  "colorscheme murphy
  "colorscheme pablo
  "colorscheme peachpuff
  "colorscheme quiet
  "colorscheme retrobox
  "colorscheme ron
  "colorscheme shine
  "colorscheme slate
  "colorscheme sorbet
  "colorscheme torte
  "colorscheme wildcharm
  "colorscheme zaibatsu
  "colorscheme zellner
catch
  colorscheme default
endtry

set nocompatible               " disable legacy vi mode
set showtabline=2              " show tab menu
set splitbelow                 " split new window below
set splitright                 " split new vertical window right
set visualbell                 " disable beeping
set noswapfile                 " disable swap file
set mouse=a                    " enable mouse
set showcmd                    " show input in the cmd line
set wildmenu                   " better auto-completion of cmd
set cmdheight=1                " height of the cmd line
set confirm                    " raise a dialog when saving
set laststatus=2               " show the status line
set ruler                      " show the position of cursor in the status line
set softtabstop=4              " use 4 spaces for a soft tab
set shiftwidth=4               " use 4 spaces for auto shift
set expandtab                  " soft tabs instead of tabs
set hlsearch                   " highlight the searching pattern
set ignorecase                 " ignore case
set smartcase                  " auto ignore case
set incsearch                  " highlight pattern when typing
set wrapscan                   " searches wrap around the end of file
set clipboard=unnamed          " host clipboard (must have vim-gtk)
set autoindent                 " copy indent from the current line when starting a new line
set showmatch                  " briefly jump to the matching paren
set matchtime=1                " time to show the matching paren
set number                     " show line numbers
set scrolloff=1                " keep a visible line at the bottom
set colorcolumn=80             " 80 characters warning line
set backspace=indent,eol,start " delete special characters freely

syntax on
filetype on
filetype indent on
filetype plugin on

" jump to the last position when reopening
au BufReadPost * exe "normal! g'\""
au WinEnter,BufWinEnter * setlocal cursorline
au WinLeave,BufWinLeave * setlocal nocursorline
au BufReadPost,BufNewFile *.c,*.cpp,*.h set cindent
au BufReadPost,BufNewFile *.html,*.md set softtabstop=2 shiftwidth=2
au BufReadPost,BufNewFile *.[mM]akefile set noexpandtab tabstop=4
au BufReadPost,BufNewFile *.py set colorcolumn=120

let mapleader=","
nnoremap <Tab> >>
nnoremap <S-Tab> <<
nnoremap <leader>y "+y
nnoremap <leader>p "+p
" erase trailing spaces
nnoremap <silent> <leader><BS> :%s/\s\+$//e<Enter>
nnoremap <Up> <Nop>
nnoremap <Down> <Nop>
nnoremap <Left> <Nop>
nnoremap <Right> <Nop>
vnoremap <Tab> >
vnoremap <S-Tab> <

try
  call plug#begin()
    Plug 'jiangmiao/auto-pairs'
  call plug#end()
catch
endtry

