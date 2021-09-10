return require('packer').startup(function()
  -- Packer can manage itself
  use 'wbthomason/packer.nvim'

  use 'vimwiki/vimwiki'
  use 'mhinz/vim-startify'

  -- Lua filetree
  use 'kyazdani42/nvim-tree.lua'

  -- Built-in LSP
  use 'neovim/nvim-lspconfig'
  use 'hrsh7th/nvim-compe'
  use 'glepnir/lspsaga.nvim'

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
