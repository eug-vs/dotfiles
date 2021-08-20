" Coc.nvim configuration
nmap <silent> gd <Plug>(coc-definition)
nnoremap <silent> <Leader>t :call <SID>show_documentation()<CR>

inoremap <expr> <cr> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"

autocmd BufNewFile,BufRead *.tsx set filetype=typescriptreact

function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  else
    call CocAction('doHover')
  endif
endfunction
