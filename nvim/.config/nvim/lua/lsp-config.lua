local nvim_lsp = require('lspconfig')

-- Use an on_attach function to only map the following keys
-- after the language server attaches to the current buffer
local on_attach = function(client, bufnr)
  local function buf_set_keymap(...) vim.api.nvim_buf_set_keymap(bufnr, ...) end
  local function buf_set_option(...) vim.api.nvim_buf_set_option(bufnr, ...) end

  --Enable completion triggered by <c-x><c-o>
  buf_set_option('omnifunc', 'v:lua.vim.lsp.omnifunc')

  -- Mappings.
  local opts = { noremap=true, silent=true }

  -- See `:help vim.lsp.*` for documentation on any of the below functions
  buf_set_keymap('n', 'gd', '<cmd>lua vim.lsp.buf.definition()<CR>', opts)
  buf_set_keymap('n', 'gD', '<cmd>lua vim.lsp.buf.type_definition()<CR>', opts)
  buf_set_keymap('n', 'gi', '<cmd>lua vim.lsp.buf.implementation()<CR>', opts)
  buf_set_keymap('n', 'gr', '<cmd>lua vim.lsp.buf.references()<CR>', opts)
  buf_set_keymap('n', 'K', '<cmd>lua vim.lsp.buf.hover()<CR>', opts)
  buf_set_keymap('n', 'L', '<cmd>lua vim.diagnostic.open_float()<CR>', opts)
  buf_set_keymap('n', '<leader>rn', '<cmd>lua vim.lsp.buf.rename()<CR>', opts)
  buf_set_keymap('n', '<leader>ca', '<cmd>lua vim.lsp.buf.code_action()<CR>', opts)
end

local flags = {
  debounce_text_changes = 150,
}

local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities = require('cmp_nvim_lsp').update_capabilities(capabilities)

-- Typescript
nvim_lsp.tsserver.setup {
  on_attach = on_attach,
  flags = flags,
  capabilities = capabilities,
  root_dir = nvim_lsp.util.root_pattern("package.json"),
}
-- Enhanced features
require('typescript').setup {
  server = {
    on_attach = on_attach,
  },
  flags = flags,
  capabilities = capabilities,
  disable_commands = false,
  go_to_source_definition = {
    fallback = true,
  },
}


-- Eslint
nvim_lsp.eslint.setup {
  on_attach = on_attach,
  flags = flags,
  capabilities = capabilities,
}

-- Prisma
nvim_lsp.prismals.setup {
  on_attach = on_attach,
  flags = flags,
  capabilities = capabilities,
}


-- Vue
nvim_lsp.vuels.setup{
  on_attach = on_attach,
  flags = flags,
  capabilities = capabilities,
}

-- Rust
nvim_lsp.rust_analyzer.setup{
  on_attach = on_attach,
  flags = flags,
  capabilities = capabilities,
}

-- Python
nvim_lsp.pylsp.setup{
  on_attach = on_attach,
  flags = flags,
  capabilities = capabilities,
}

-- C
nvim_lsp.ccls.setup {
  on_attach = on_attach,
  flags = flags,
  capabilities = capabilities,
}

-- Deno
nvim_lsp.denols.setup {
  on_attach = on_attach,
  flags = flags,
  capabilities = capabilities,
  root_dir = nvim_lsp.util.root_pattern("deno.json", "deno.jsonc"),
}

-- Lua
local runtime_path = vim.split(package.path, ';')
table.insert(runtime_path, "lua/?.lua")
table.insert(runtime_path, "lua/?/init.lua")

nvim_lsp.sumneko_lua.setup {
  on_attach = on_attach,
  flags = flags,
  capabilities = capabilities,
  cmd = { '/usr/bin/lua-language-server' }, -- Install from yay
  settings = {
    Lua = {
      runtime = {
        -- Tell the language server which version of Lua you're using (most likely LuaJIT in the case of Neovim)
        version = 'LuaJIT',
        -- Setup your lua path
        path = runtime_path,
      },
      diagnostics = {
        -- Get the language server to recognize the `vim` global
        globals = {'vim'},
      },
      workspace = {
        -- Make the server aware of Neovim runtime files
        library = vim.api.nvim_get_runtime_file("", true),
      },
      -- Do not send telemetry data containing a randomized but unique identifier
      telemetry = {
        enable = false,
      },
    },
  },
}

