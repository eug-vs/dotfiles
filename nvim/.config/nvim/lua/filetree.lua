local tree_cb = require'nvim-tree.config'.nvim_tree_callback

vim.api.nvim_set_keymap('n', '<F3>', ':NvimTreeToggle<CR>', { noremap = true, silent = true })

vim.g.nvim_tree_auto_close = 1
vim.g.nvim_tree_group_empty = 1

vim.g.nvim_tree_bindings = {
  { key = "l", cb = tree_cb("edit") },
  { key = "h", cb = tree_cb("parent_node") and tree_cb("close_node") },
  { key = "cw", cb = tree_cb("rename") },
  { key = "o", cb = tree_cb("create") },
}
