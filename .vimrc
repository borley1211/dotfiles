set encoding=utf-8
scriptencoding utf-8

set fileencoding=utf-8 " 保存時の文字コード
set fileencodings=ucs-boms,utf-8,euc-jp,cp932 " 読込時の文字コードの自動判別(左側優先)
set fileformats=unix,dos,mac " 改行コードの自動判別(左側優先)
set ambiwidth=double " 絵文字類が崩れる問題を解決

set title
set showmatch
set cursorline
set cursorcolumn
set number

set incsearch
set smartcase
set hlsearch

" ESCキー2度押しでハイライトの切り替え
nnoremap <silent><Esc><Esc> :<C-u>set nohlsearch!<CR>

set expandtab
set autoindent
set smartindent
set tabstop=4
set softtabstop=4
set shiftwidth=4
set smarttab

set autoread
set noswapfile
set showcmd
set wildmenu
set whichwrap=b,s,h,l,<,>,[,]
set hidden

set clipboard=unnamedplus

" 実行環境がWSLであるかを判定
if filereadable("/proc/sys/fs/binfmt_misc/WSLInterop")
    set term=xterm-256color
endif
syntax enable

inoremap { {}<Left>
inoremap {<Enter> {}<Left><CR><ESC><S-o>
inoremap ( ()<ESC>i
inoremap (<Enter> ()<Left><CR><ESC><S-o>

" 実行環境がWSLであるかを判定
if filereadable("/proc/sys/fs/binfmt_misc/WSLInterop")
    nnoremap <silent>yy :.w !win32yank.exe -i<CR><CR>
    vnoremap <silent>y :w !win32yank.exe -i<CR><CR>
    nnoremap <silent>dd :.w !win32yank.exe -i<CR>dd
    vnoremap <silent>d x:let pos = getpos(".")<CR>GpVG:w !win32yank.exe -i<CR>VGx:call setpos(".", pos)<CR>
    nnoremap <silent>p :r !win32yank.exe -o<CR>
    vnoremap <silent>p :r !win32yank.exe -o<CR>
endif

let g:molokai_original = 1
colorscheme molokai
