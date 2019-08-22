"[Initial Config for Encoding]
set encoding=utf-8
scriptencoding utf-8


"[ファイル入出力における文字コード設定]
set fileencoding=utf-8 " 保存時の文字コード
set fileencodings=ucs-boms,utf-8,euc-jp,cp932 " 読込時の文字コードの自動判別(左側優先)
set fileformats=unix,dos,mac " 改行コードの自動判別(左側優先)
set ambiwidth=double " 絵文字等が崩れる問題を解決


"[ステータス表示]
set title
set showmode
set showcmd
set wildmenu


"[括弧/タグジャンプ]
set showmatch
source $VIMRUNTIME/macros/matchit.vim " Vimの「%」を拡張


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
nnoremap <silent><Esc><Esc> :<C-u>set nohlsearch!<CR>  " ESCキー2度押しでハイライトの切り替え


"[インデント/タブ]
set expandtab
set autoindent
set smartindent
set tabstop=4
set softtabstop=4
set shiftwidth=4
set smarttab


"[マウス有効化]
if has('mouse')
    set mouse=a
    if has('mouse_sgr')
        set ttymouse=sgr
    elseif v:version > 703 || v:version is 703 && has('patch632')
        set ttymouse=sgr
    else
        set ttymouse=xterm2
    endif
endif


"[ファイル処理]
set confirm
set autoread
set nobackup
set noswapfile
set hidden


"[バックスペースキー有効化]
set backspace=indent,eol,start


"[ターミナルカラー設定]
"" 実行環境がWSLであるか判定
if filereadable("/proc/sys/fs/binfmt_misc/WSLInterop")
    set term=xterm-256color
endif


"[シンタックスハイライト]
syntax enable


"[カット/コピー/ペースト]
set clipboard=unnamedplus
inoremap { {}<Left>
inoremap {<Enter> {}<Left><CR><ESC><S-o>
inoremap ( ()<ESC>i
inoremap (<Enter> ()<Left><CR><ESC><S-o>

"" 実行環境がWSLであるか判定
if filereadable("/proc/sys/fs/binfmt_misc/WSLInterop")
    nnoremap <silent>yy :.w !win32yank.exe -i<CR><CR>
    vnoremap <silent>y :w !win32yank.exe -i<CR><CR>
    nnoremap <silent>dd :.w !win32yank.exe -i<CR>dd
    vnoremap <silent>d x:let pos = getpos(".")<CR>GpVG:w !win32yank.exe -i<CR>VGx:call setpos(".", pos)<CR>
    nnoremap <silent>p :r !win32yank.exe -o<CR>
    vnoremap <silent>p :r !win32yank.exe -o<CR>
endif

"" ペースト時の自動インデント防止
if &term =~ "xterm"
    let &t_SI .= "\e[?2004h"
    let &t_EI .= "\e[?2004l"
    let &pastetoggle = "\e[201~"

    function XTermPasteBegin(ret)
        set paste
        return a:ret
    endfunction

    inoremap <special> <expr> <Esc>[200~ XTermPasteBegin("")
endif


"[カラースキーマ]
""  リポジトリを
""      $VIMRUNTIME/pack/(unique_dirname)/start/
""  以下に**cdして**クローンすること
let g:molokai_original = 1
colorscheme molokai
