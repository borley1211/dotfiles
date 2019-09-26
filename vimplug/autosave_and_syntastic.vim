let g:syntastic_enable_signs=1
let g:syntastic_auto_loc_list=2
let g:syntastic_mode_map = {'mode': 'passive'} 
augroup AutoSyntastic
    autocmd!
    autocmd InsertLeave,TextChanged * call s:syntastic() 
augroup END
function! s:syntastic()
    w
    SyntasticCheck
endfunction
