require'nvim-treesitter.configs'.setup {
  highlight = {
    enable = true,
    disable = {},
  },
  indent = {
    enable = true,
    disable = {},
  },
  ensure_installed = {
    "javascript",
    "typescript",
    "tsx",
    "python",
    "json",
    "yaml",
    "html",
    "scss"
  },
}

local parser_config = require "nvim-treesitter.parsers".get_parser_configs()
parser_config.tsx.filetype_to_parsename = { "javascript", "typescript.tsx" }
