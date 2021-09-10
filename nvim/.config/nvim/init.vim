" Neovim configuration file
" Author: eug-vs
" Email: eugene@eug-vs.xyz

" Enter the current millenium
set nocompatible
syntax enable
filetype plugin on

" General stuff
set number relativenumber
set ignorecase smartcase
set splitbelow splitright
set termguicolors
set cursorline
set hidden
set nowrap
set ruler
set mouse=a
set clipboard=unnamedplus
set scrolloff=3
set conceallevel=0

" Indentation
set smarttab expandtab
set smartindent autoindent
set tabstop=2
set shiftwidth=2
set showtabline=2

" Colorscheme
let g:gruvbox_material_enable_bold = 1
let g:gruvbox_material_menu_selection_background = 'green'
let g:gruvbox_material_sign_column_background = 'none'
let g:gruvbox_material_visual = 'green background'
let g:gruvbox_material_palette = 'original'
colorscheme gruvbox-material

" Built-in fuzzy-finder
set path=.,**
set wildmenu
set wildignore+=**/node_modules/**,**/build/**,**/dist/**,**/__pycache__/**
set wildmode=longest,list,full

" Easier window navigation
nnoremap <c-h> <C-w>h
nnoremap <c-j> <C-w>j
nnoremap <c-k> <C-w>k
nnoremap <c-l> <C-w>l

" Easier indentation
vnoremap < <gv
vnoremap > >gv

" Remove trailing whitespace on save
autocmd BufWritePre * %s/\s\+$//e

" Vimrc management
nnoremap <leader>ev :vs $MYVIMRC<CR>
nnoremap <leader>sv :source $MYVIMRC<CR>

" Load plugins
set runtimepath^=~/.vim runtimepath+=~/.vim/after
let &packpath = &runtimepath
lua require('plugins')

" Telescope
" TODO: move this ugly line into a function or smth
nnoremap <silent><leader>ff :lua require('telescope.builtin').find_files(require('telescope.themes').get_dropdown({ previewer = false, find_command = { 'rg', '--files', '--iglob', '!.git', '--hidden' } }))<CR>
nnoremap <silent><Leader>fr :Telescope live_grep<CR>

source ~/.config/nvim/startify.vim
source ~/.config/nvim/vimwiki.vim

lua require('lsp-config')
lua require('lsp-saga')
lua require('completion')
lua require('treesitter')
lua require('filetree')
