set title
set showmatch
set autoindent
set smartindent
set cursorline
set cursorcolumn
set number

set incsearch
set smartcase
set hlsearch

set expandtab
set tabstop=4
set shiftwidth=4
set smarttab

set autoread
set noswapfile
set showcmd
set wildmenu
set whichwrap=b,s,h,l,<,>,[,]
set hidden

set clipboard=unnamedplus

set term=xterm-256color
syntax enable

inoremap { {}<Left>
inoremap {<Enter> {}<Left><CR><ESC><S-o>
inoremap ( ()<ESC>i
inoremap (<Enter> ()<Left><CR><ESC><S-o>

inoremap <silent> ee <Esc>

let g:molokai_original = 1
colorscheme molokai
