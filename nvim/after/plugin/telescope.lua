require('telescope').setup{
  extensions = {
    file_browser = {
      theme = "ivy",
      hijack_netrw = true,
    },
  },
}

local builtin = require('telescope.builtin')

vim.keymap.set('n', '<leader>f', builtin.find_files, {}) -- Find File
vim.keymap.set('n', '<leader>d', builtin.diagnostics, {}) -- Find Diagnostics
vim.keymap.set('n', '<leader>S', builtin.lsp_workspace_symbols, {}) -- Find Workspace Symbols
vim.keymap.set('n', '<leader>s', builtin.lsp_document_symbols, {}) -- Find Workspace Symbols
vim.keymap.set('n', '<leader>t', builtin.lsp_type_definitions, {}) -- Find Type Definitions
vim.keymap.set('n', '<leader>j', builtin.buffers, {}) -- Find Buffers

require("telescope").load_extension "file_browser"
