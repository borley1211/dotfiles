"[Initial Config for Encoding]
set encoding=utf-8
scriptencoding utf-8


"[ファイル入出力における文字コード設定]
set fileencoding=utf-8  " 保存時の文字コード
set fileencodings=utf-8,iso-2022-jp,euc-jp,sjis,cp932   " 読込時の文字コードの自動判別(左側優先)
set fileformats=unix,dos,mac    " 改行コードの自動判別(左側優先)
set ambiwidth=double    " 絵文字等が崩れる問題を解決


"[dein]
let s:deinrc = expand('$DOTPATH/deinrc.vim')
exe 'source' s:deinrc


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
set ignorecase
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
set noswapfile
set hidden


"[バックスペースキー有効化]
set backspace=indent,eol,start


"[カット/コピー/ペースト]
inoremap { {}<Left>
inoremap {<Enter> {}<Left><CR><ESC><S-o>
inoremap ( ()<ESC>i
inoremap (<Enter> ()<Left><CR><ESC><S-o>

set pastetoggle=<C-p>


"[IME]
set iminsert=0
set imsearch=0
set imcmdline

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
let g:molokai_original=1
colorscheme molokai
