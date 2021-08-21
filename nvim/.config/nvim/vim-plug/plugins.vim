call plug#begin('~/.config/nvim/autoload/plugged')
    Plug 'mhinz/vim-startify'
    Plug 'vimwiki/vimwiki'
    Plug 'tonchis/vim-to-github'
    " Dark-powered file explorer
    Plug 'shougo/defx.nvim',
    Plug 'kristijanhusak/defx-icons'
    Plug 'kristijanhusak/defx-git'
    Plug 't9md/vim-choosewin'
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
    " Telescope
    Plug 'nvim-lua/plenary.nvim'
    Plug 'nvim-telescope/telescope.nvim'
call plug#end()
