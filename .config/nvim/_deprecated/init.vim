"[Initial Config for Encoding]
set encoding=utf-8
scriptencoding utf-8

"[ファイル入出力における文字コード設定]
set fileencoding=utf-8  " 保存時の文字コード
set fileencodings=utf-8,iso-2022-jp,euc-jp,sjis,cp932   " 読込時の文字コードの自動判別(左側優先)
set fileformats=unix,dos,mac    " 改行コードの自動判別(左側優先)
"set ambiwidth=double    " 絵文字等が崩れる問題を解決

"[Python]
if has('win32')
    let s:pythonpath = trim(system('which.exe python.exe'))
else
    let s:pythonpath = trim(system('which python'))
endif
if has('PYENV_ROOT')
    let s:pythonpath = $PYENV_ROOT.'shims/python'
endif
let g:python_host_prog = s:pythonpath
let g:python3_host_prog = s:pythonpath

"[dein.vim]
" Install dein.vim
let $CACHE = expand('~/.cache')
if !isdirectory($CACHE)
  call mkdir($CACHE, 'p')
endif
if &runtimepath !~# '/dein.vim'
  let s:dein_dir = fnamemodify('dein.vim', ':p')
  if !isdirectory(s:dein_dir)
    let s:dein_dir = $CACHE .. '/dein/repos/github.com/Shougo/dein.vim'
    if !isdirectory(s:dein_dir)
      execute '!git clone https://github.com/Shougo/dein.vim' s:dein_dir
    endif
  endif
  execute 'set runtimepath^=' .. substitute(
        \ fnamemodify(s:dein_dir, ':p') , '[/\\]$', '', '')
endif

" Ward off unexpected things that your distro might have made, as
" well as sanely reset options when re-sourcing .vimrc
set nocompatible

" Set dein base path (required)
let s:dein_base = '~/.cache/dein/'

" Set dein source path (required)
let s:dein_src = '~/.cache/dein/repos/github.com/Shougo/dein.vim'

" Set dein runtime path (required)
execute 'set runtimepath+=' .. s:dein_src

" Call dein initialization (required)
call dein#begin(s:dein_base)

call dein#add(s:dein_src)

" Your plugins go here:
" Load TOML
call dein#load_toml($DOTPATH.'/dein.toml')
call dein#load_toml($DOTPATH.'/dein_lazy.toml', {'lazy': 1})

" Finish dein initialization (required)
call dein#end()

" Attempt to determine the type of a file based on its name and possibly its
" contents. Use this to allow intelligent auto-indenting for each filetype,
" and for plugins that are filetype specific.
filetype indent plugin on

" Enable syntax highlighting
if has('syntax')
  syntax on
endif

" Uncomment if you want to install not-installed plugins on startup.
if dein#check_install()
  call dein#install()
endif
"End dein Scripts-------------------------

"[Transparency]
set termguicolors
"set pumblend=20
"set winblend=10

"[ステータス表示]
set title titlelen=70
let &titleold = getcwd()
set showmode
set showcmd
set wildmenu
set modeline

"[括弧/タグジャンプ]
set showmatch
"source $VIMRUNTIME/macros/matchit.vim   " Vimの「%」を拡張

"[カーソル]
set whichwrap=b,s,h,l,<,>,[,]
set cursorline
set cursorcolumn
set number

"[検索設定]
set incsearch
"set ignorecase
set smartcase
set hlsearch
nnoremap <silent><Esc><Esc> :<C-u>set nohlsearch!<CR>

"[インデント/タブ]
set expandtab
set autoindent
set smartindent
set shiftround
set tabstop=4
set softtabstop=4
set shiftwidth=4
set smarttab
" show break-points
set showbreak=↳
" for linewrapping
set textwidth=0
set colorcolumn=89  " for PEP8

"[マウス有効化]
if has('mouse')
    set mouse=a
endif

"[ファイル処理]
set confirm
set autoread
set nobackup
set nowritebackup
set noswapfile
set hidden

"[バックスペースキー有効化]
set backspace=indent,eol,start

"[カット/コピー/ペースト]
inoremap { {}<Left>
inoremap {<Enter> {}<Left><CR><ESC><S-o>
inoremap ( ()<ESC>i
inoremap (<Enter> ()<Left><CR><ESC><S-o>

nnoremap <silent> <f5> :set paste!<cr>
inoremap <silent> <f5> <esc>:set paste!<cr>i

"[IME]
set iminsert=0
set imsearch=0

" on fcitx
" 「日本語入力固定モード」の動作設定
let IM_CtrlMode=6
" 「日本語入力固定モード」切替キー
inoremap <silent> <C-j> <C-r>=IMState('FixMode')<CR>
" <ESC>押下後のIM切替開始までの反応が遅い場合はttimeoutlenを短く設定してみてください(ミリ秒)
set timeout timeoutlen=3000 ttimeoutlen=50

" コマンドラインの高さを2に
set cmdheight=2

" 矢印キーでなら行内を動けるように
nnoremap <Down> gj
nnoremap <Up>   gk

"[カラースキーマ]
"let g:molokai_original=1
"colorscheme molokai

"[coc.nvim]
set updatetime=300
set shortmess+=c
set signcolumn=yes
set statusline^=%{coc#status()}%{get(b:,'coc_current_function','')}

"[for dein-ui.vim]
set modifiable

"[for Terminal Mode]
"通常モードにEscで戻る
tnoremap <Esc> <C-\><C-n>
"現在のウィンドウ下部にTerminalを開く
command! -nargs=* T split | wincmd j | resize 20 | terminal <args>
"Terminal起動時のデフォルトを入力モードに
autocmd TermOpen * startinsert
