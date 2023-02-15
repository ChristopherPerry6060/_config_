require('telescope').setup{
  extensions = {
    file_browser = {
      theme = "ivy",
      hijack_netrw = true,
    },
  },
}

local builtin = require('telescope.builtin')

vim.keymap.set('n', '<leader>ff', builtin.find_files, {}) -- Find File
vim.keymap.set('n', '<leader>fd', builtin.diagnostics, {}) -- Find Diagnostics
vim.keymap.set('n', '<leader>fS', builtin.lsp_workspace_symbols, {}) -- Find Workspace Symbols
vim.keymap.set('n', '<leader>fs', builtin.lsp_document_symbols, {}) -- Find Workspace Symbols
vim.keymap.set('n', '<leader>ft', builtin.lsp_type_definitions, {}) -- Find Type Definitions
vim.keymap.set('n', '<leader>fg', builtin.live_grep, {}) -- Find Live Grep
vim.keymap.set('n', '<leader>fb', builtin.buffers, {}) -- Find Buffers
vim.keymap.set('n', '<leader>fh', builtin.help_tags, {}) -- Find Help

require("telescope").load_extension "file_browser"
