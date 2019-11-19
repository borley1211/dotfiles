if &compatible
    set nocompatible
endif

let s:dein_dir = expand('$HOME/.cache/dein')
let s:dein_repo_dir = expand('$HOME/.cache/dein/repos/github.com/Shougo/dein.vim')

" なければgit clone
if !isdirectory(s:dein_repo_dir)
    execute '!git clone https://github.com/Shougo/dein.vim' s:dein_repo_dir
endif
let &runtimepath.=','.expand(s:dein_repo_dir)

if dein#load_state(s:dein_dir)
    call dein#begin(s:dein_dir)
    call dein#add(s:dein_repo_dir)

    " 管理するプラグインを記述したファイル
    let s:toml = expand('$DOTPATH/dein.toml')
    let s:lazy_toml = expand('$DOTPATH/dein_lazy.toml')
    call dein#load_toml(s:toml, {'lazy': 0})
    call dein#load_toml(s:lazy_toml, {'lazy': 1})

    call dein#end()
    call dein#save_state()
endif

filetype plugin indent on
syntax enable

if dein#check_install()
    call dein#install()
endif
