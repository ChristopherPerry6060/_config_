require('telescope').setup {
    extensions = {
        file_browser = {
            theme = "ivy",
            hijack_netrw = true,
        },
    },
}

local builtin = require('telescope.builtin')

vim.keymap.set('n', '<leader>f', builtin.find_files, {}) -- Find File
vim.keymap.set('n', '<leader>j', builtin.buffers, {})
vim.keymap.set('n', '<leader>g', builtin.live_grep, {})
vim.keymap.set('n', '<leader>x', builtin.quickfix, {})
vim.keymap.set('n', '<leader>m', builtin.marks, {})
vim.keymap.set('n', '<leader>e', builtin.registers, {})

vim.keymap.set('n', '<leader>d', builtin.diagnostics, {}) -- Find Diagnostics
vim.keymap.set('n', '<leader>R', builtin.lsp_references, {})
vim.keymap.set('n', '<leader>i', builtin.lsp_implementations, {})
vim.keymap.set('n', '<leader>t', builtin.lsp_type_definitions, {})
vim.keymap.set('n', '<leader>S', builtin.lsp_workspace_symbols, {}) -- Find Workspace Symbols
vim.keymap.set('n', '<leader>s', builtin.lsp_document_symbols, {}) -- Find Workspace Symbols

require("telescope").load_extension "file_browser"
