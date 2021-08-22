call plug#begin('~/.config/nvim/autoload/plugged')
    Plug 'vimwiki/vimwiki'
    Plug 'mhinz/vim-startify'
    " Lua filetree
    Plug 'kyazdani42/nvim-tree.lua'
    " Built-in LSP
    Plug 'neovim/nvim-lspconfig'
    Plug 'hrsh7th/nvim-compe'
    " Treesitter
    Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
    Plug 'nvim-treesitter/playground'
    " Color scheme
    Plug 'sainnhe/gruvbox-material'
    " Telescope
    Plug 'nvim-lua/plenary.nvim'
    Plug 'nvim-telescope/telescope.nvim'
    Plug 'kyazdani42/nvim-web-devicons'
    " Misc
    Plug 'christoomey/vim-tmux-navigator'
    Plug 'editorconfig/editorconfig-vim'
    Plug 'ap/vim-css-color'
    Plug 'airblade/vim-gitgutter'
    Plug 'Raimondi/delimitMate'
    Plug 'tonchis/vim-to-github'
call plug#end()
