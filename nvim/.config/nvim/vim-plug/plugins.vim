call plug#begin('~/.config/nvim/autoload/plugged')
    Plug 'mhinz/vim-startify', {'branch': 'center'}
    Plug 'vimwiki/vimwiki'
    Plug 'tonchis/vim-to-github'
    " Dark-powered file explorer
    Plug 'shougo/defx.nvim',
    Plug 'kristijanhusak/defx-icons'
    Plug 'kristijanhusak/defx-git'
    Plug 't9md/vim-choosewin'
    " FZF
    Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
    Plug 'junegunn/fzf.vim'
    " Tmux navigator
    Plug 'christoomey/vim-tmux-navigator'
    " Color scheme
    Plug 'morhetz/gruvbox'
    " Editorconfig
    Plug 'editorconfig/editorconfig-vim'
    " Languages
    Plug 'pangloss/vim-javascript'
    Plug 'leafgarland/typescript-vim' "typescript syntax
    Plug 'peitalin/vim-jsx-typescript' "react jsx typescript syntax
    Plug 'ap/vim-css-color'
    " Git gutter
    Plug 'airblade/vim-gitgutter'
     " Matching brackets
    Plug 'Raimondi/delimitMate'
    " Built-in LSP
    Plug 'neovim/nvim-lspconfig'
    Plug 'hrsh7th/nvim-compe'
call plug#end()
