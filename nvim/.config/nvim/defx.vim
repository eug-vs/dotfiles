" Defx configuration
nnoremap <silent> <F3> :Defx<CR>
autocmd FileType defx call s:defx_my_settings()
autocmd BufEnter * if(winnr("$") == 1 && &ft == 'defx') | q | endif
autocmd BufWritePost * call defx#redraw()

function! SmartTabEdit(context) abort
  tabnew
  execute "e " . a:context.targets[0]
  tabp
endfunction

function! s:defx_my_settings() abort
  set nonumber norelativenumber

  nnoremap <buffer><expr> l
  \ defx#is_directory() ?
  \ defx#do_action('open_tree') :
  \ defx#do_action('open', 'choose')
  nnoremap <silent><buffer><expr> t defx#do_action('call', 'SmartTabEdit')
  nnoremap <silent><buffer><expr> h defx#do_action('close_tree')
  nnoremap <silent><buffer><expr> dd defx#do_action('remove')
  nnoremap <silent><buffer><expr> cw defx#do_action('rename')
  nnoremap <silent><buffer><expr> o defx#do_action('new_file')
  nnoremap <silent><buffer><expr> q defx#do_action('quit')
endfunction

call defx#custom#option('_', {
\ 'toggle': 1,
\ 'resume': 1,
\ 'show_ignored_files': 1,
\ 'buffer_name': 'explorer',
\ 'split': 'vertical',
\ 'direction': 'topleft',
\ 'columns': 'space:indent:git:icons:space:filename:mark',
\ 'winwidth': 30,
\ })
