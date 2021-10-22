return require('packer').startup(function(use)
  -- Packer can manage itself
  use 'wbthomason/packer.nvim'

  use 'vimwiki/vimwiki'
  use 'mhinz/vim-startify'

  -- Lua filetree
  use 'kyazdani42/nvim-tree.lua'

  -- Built-in LSP
  use 'neovim/nvim-lspconfig'

  -- Autocompletion
  use 'hrsh7th/nvim-cmp'
  use 'hrsh7th/cmp-buffer'
  use 'hrsh7th/cmp-path'
  use 'hrsh7th/cmp-nvim-lsp'
  use 'hrsh7th/cmp-nvim-lua'
  use 'onsails/lspkind-nvim'

  -- Snippets (only used for autocompletion)
  use 'L3MON4D3/LuaSnip'
  use 'saadparwaiz1/cmp_luasnip'

  -- Treesitter
  use { 'nvim-treesitter/nvim-treesitter', run = ':TSUpdate' }
  use 'nvim-treesitter/playground'

  -- Color scheme
  use 'sainnhe/gruvbox-material'

  -- Telescope
  use 'nvim-lua/plenary.nvim'
  use 'nvim-telescope/telescope.nvim'
  use 'kyazdani42/nvim-web-devicons'

  -- Misc
  use 'christoomey/vim-tmux-navigator'
  use 'editorconfig/editorconfig-vim'
  use 'ap/vim-css-color'
  use 'airblade/vim-gitgutter'
  use 'Raimondi/delimitMate'
  use 'tonchis/vim-to-github'
end)
