local tree_cb = require'nvim-tree.config'.nvim_tree_callback

require'nvim-tree'.setup {
  open_on_setup = true,
  hijack_cursor = true,
  view = {
    mappings = {
      list = {
        { key = "l", cb = tree_cb("edit") },
        { key = "h", cb = tree_cb("parent_node") and tree_cb("close_node") },
        { key = "cw", cb = tree_cb("rename") },
        { key = "o", cb = tree_cb("create") },
      }
    }
  }
}

vim.api.nvim_set_keymap('n', '<F3>', ':NvimTreeToggle<CR>', { noremap = true, silent = true })
vim.api.nvim_command('autocmd BufEnter * ++nested if winnr("$") == 1 && bufname() == "NvimTree_" . tabpagenr() | quit | endif')
