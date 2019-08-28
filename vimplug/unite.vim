"[unite.vimの設定]
noremap <C-U><C-F> :Unite -buffer-name=file file<CR>
noremap <C-U><C-R> :Unite file_mru<CR>

au FileType unite nnoremap <silent> <buffer> <expr> <C-i> unite#do_action('split')
au FileType unite inoremap <silent> <buffer> <expr> <C-i> unite#do_action('split')

" ESCキーを2回押すと終了する
au FileType unite nnoremap <silent> <buffer> <ESC><ESC> q
au FileType unite inoremap <silent> <buffer> <ESC><ESC> <ESC>q
