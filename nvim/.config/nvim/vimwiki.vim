" Vimwiki configuration
let g:vimwiki_list = [
  \ {'path': '~/Sync/', 'syntax': 'markdown', 'ext': '.md', 'auto_generate_links': 1},
  \ {'path': '~/Documents/Projects/eug-vs-xyz', 'syntax': 'markdown', 'ext': '.md', 'auto_generate_links': 1, 'diary_rel_path': 'blog/', 'diary_index': 'index', 'diary_header': "Blog"},
  \ {'path': '~/Documents/wiki/', 'syntax': 'markdown', 'ext': '.md'},
\]

let g:vimwiki_markdown_link_ext = 1

autocmd FileType vimwiki setlocal spell wrap linebreak

nnoremap <Leader>c :let &cole=(&cole == 2) ? 0 : 2 <bar> echo 'conceallevel ' . &cole <CR>

function! VimwikiLinkHandler(link)
  let link = a:link
  if link =~# '^vfile:'
    let link = link[1:]
  else
    return 0
  endif
  let link_infos = vimwiki#base#resolve_link(link)
  if link_infos.filename == ''
    echomsg 'Vimwiki Error: Unable to resolve link!'
    return 0
  else
    exe 'e ' . fnameescape(link_infos.filename)
    return 1
  endif
endfunction
