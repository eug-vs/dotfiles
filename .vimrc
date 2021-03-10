" Vim configuration file
" Author: eug-vs


" enter the current millenium
set nocompatible
syntax enable
filetype plugin on

" general stuff
set mouse=a
set number
set relativenumber
set cursorline
set hidden                              " Required to keep multiple buffers open multiple buffers
set nowrap                              " Display long lines as just one line
set ruler              			            " Show the cursor position all the time
set conceallevel=0                      " So that I can see `` in markdown files
set tabstop=2                           " Insert 2 spaces for a tab
set shiftwidth=2                        " Change the number of space characters inserted for indentation
set scrolloff=4                         " Scroll offset
set smarttab                            " Makes tabbing smarter will realize you have 2 vs 4
set expandtab                           " Converts tabs to spaces
set smartindent                         " Makes indenting smart
set autoindent                          " Good auto indent
set showtabline=2                       " Always show tabs
set noshowmode                          " We don't need to see things like -- INSERT -- anymore
set clipboard=unnamedplus               " Copy paste between vim and everything else
set termguicolors
set ignorecase
set smartcase

" enable gruvbox colorscheme:
autocmd vimenter * ++nested colorscheme gruvbox

" vimrc management
nnoremap <leader>ev :rightbelow vs ~/.vimrc<CR>
nnoremap <leader>sv :source $MYVIMRC<CR>

" windows
set splitbelow
set splitright
nnoremap <TAB> <C-w>w
nnoremap <S-TAB> <C-w>W
nnoremap <c-h> <C-w>h
nnoremap <c-j> <C-w>j
nnoremap <c-k> <C-w>k
nnoremap <c-l> <C-w>l

" Defx
nnoremap <silent> <F3> :Defx<CR>
autocmd FileType defx call s:defx_my_settings()
autocmd BufEnter * if(winnr("$") == 1 && &ft == 'defx') | q | endif

function! s:defx_my_settings() abort
  set nonumber
  set norelativenumber

  nnoremap <buffer><expr> l
  \ defx#is_directory() ?
  \ defx#do_action('open_tree') :
  \ defx#do_action('open', 'choose')
  nnoremap <silent><buffer><expr> h defx#do_action('close_tree')
  nnoremap <silent><buffer><expr> dd defx#do_action('remove')
  nnoremap <silent><buffer><expr> cw defx#do_action('rename')
  nnoremap <silent><buffer><expr> n defx#do_action('new_file')
  nnoremap <silent><buffer><expr> q defx#do_action('quit')
endfunction

call defx#custom#option('_', {
\ 'toggle': 1,
\ 'resume': 1,
\ 'show_ignored_files': 1,
\ 'buffer_name': 'explorer',
\ 'split': 'vertical',
\ 'direction': 'topleft',
\ 'columns': 'space:indent:git:icons:filename:mark',
\ 'winwidth': 30,
\ })

" Startify
let g:startify_session_delete_buffers = 1
let g:startify_session_persistence = 1
let g:startify_change_to_vcs_root = 1
let g:startify_padding_left = 4

let g:startify_custom_header = startify#pad(startify#fortune#cowsay('', '═','║','╔','╗','╝','╚'))

let g:startify_bookmarks = [
  \ { 'r': '~/.vimrc' },
  \ { 'z': '~/.zshrc' },
\ ]

let g:startify_lists = [
  \ { 'type': 'bookmarks', 'header': ['   Bookmarks:'] },
  \ { 'type': 'dir', 'header': ['   Recently edited files:'] },
  \ { 'type': 'sessions', 'header': ['   Sessions:'] },
\]


" startup screen
autocmd VimEnter *
  \   if !argc()
  \ |   Startify
  \ |   Defx
  \ |   wincmd w
  \ | endif

" built-in fuzzy-finder
set path=.,**
set wildmenu
set wildignore+=**/node_modules/**,**/build/**,**/dist/**,**/__pycache__/**
set wildmode=longest,list,full

" tags
command! MakeTags !ctags -R -f .git/tags --tag-relative --exclude=node_modules --exclude=.git --exclude=build --exclude=dist --map-Typescript=+.tsx
set tags+=.git/tags

" enable typescipt highlighting
augroup SyntaxSettings
    autocmd!
    autocmd BufNewFile,BufRead *.tsx set filetype=typescript
augroup END

" easier indentation
vnoremap < <gv
vnoremap > >gv

" remove trailing spaces on save
autocmd BufWritePre * %s/\s\+$//e

" Vimwiki
let g:vimwiki_list = [{'path': '~/Documents/wiki/', 'syntax': 'markdown', 'ext': '.md'}]
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

" TODO: command to toggle comments https://www.chrisatmachine.com/Neovim/09-vim-commentary/
