local lsp = require("lsp-zero")

lsp.preset({
    name = "recommended",
    suggest_lsp_servers = false,
})

local cmp = require('cmp')
local cmp_select = { behavior = cmp.SelectBehavior.Select }
local cmp_mappings = lsp.defaults.cmp_mappings({
    ['<C-p>'] = cmp.mapping.select_prev_item(cmp_select),
    ['<C-n>'] = cmp.mapping.select_next_item(cmp_select),
    ['<C-y>'] = cmp.mapping.confirm({ select = true }),
    ["<C-Space>"] = cmp.mapping.complete(),
    ['<C-k>'] = cmp.mapping.scroll_docs( -4),
    ['<C-j>'] = cmp.mapping.scroll_docs(4),
})

lsp.setup_nvim_cmp({
    mapping = cmp_mappings,
    sources = {
        { name = 'path' },
        { name = 'nvim_lsp' },
        { name = 'buffer' }
    }
})

lsp.setup()

lsp.on_attach(function(client, bufnr)
    local opts = { buffer = bufnr, remap = false }
    vim.keymap.set("n", "<leader>D", function() vim.lsp.buf.definition() end, opts)
    vim.keymap.set("n", "<leader>k", function() vim.lsp.buf.hover() end, opts)
    vim.keymap.set("n", "<leader>l", function() vim.diagnostic.open_float() end, opts)
    vim.keymap.set("v", "<leader>a", function() vim.lsp.buf.code_action() end, opts)
    vim.keymap.set("n", "<leader>a", function() vim.lsp.buf.code_action() end, opts)
    vim.keymap.set("n", "<leader>r", function() vim.lsp.buf.rename() end, opts)
    vim.keymap.set("n", "<leader>h", function() vim.lsp.buf.format { async = true } end, opts)
    vim.keymap.set("i", "<C-h>", function() vim.lsp.buf.signature_help() end, opts)
end)



vim.lsp.handlers["textDocument/hover"] = vim.lsp.with(
    vim.lsp.handlers.hover, {
    border = nil,
    title = nil,
})

vim.diagnostic.config({
    virtual_text = false,
    update_in_insert = true,
    underline = false,
    signs = false,
    float = {
        focusable = true,
        style = 'minimal',
        border = 'none',
        source = 'always',
        header = '',
        prefix = '',
    },
})


local builtin = require('telescope.builtin')
require("telescope").load_extension('harpoon')


vim.keymap.set('n', '<leader>f', builtin.find_files, {}) -- Find File
vim.keymap.set('n', '<leader>g', builtin.live_grep, {})
vim.keymap.set('n', '<leader>x', builtin.quickfix, {})
vim.keymap.set('n', '<leader>e', builtin.registers, {})
vim.keymap.set('n', '<leader>R', builtin.lsp_references, {})
vim.keymap.set('n', '<leader>i', builtin.lsp_implementations, {})
vim.keymap.set('n', '<leader>t', builtin.lsp_type_definitions, {})
vim.keymap.set('n', '<leader>S', builtin.lsp_workspace_symbols, {}) -- Find Workspace Symbols
vim.keymap.set('n', '<leader>s', builtin.lsp_document_symbols, {}) -- Find Workspace Symbols
-- Find Diagnostics
vim.keymap.set('n', '<leader>d', function() builtin.diagnostics({ line_width = 1000, no_sign = true }) end, {})


-- Harpoon Harpoon
-- Harpoon Harpoon
local harpoon_ui = require("harpoon.ui")
local harpoon_mark = require("harpoon.mark")
local harpoon = require("harpoon")

vim.keymap.set('n', '<leader>M', ':Telescope harpoon marks<CR>', {})
vim.keymap.set('n', '<leader>j', harpoon_ui.toggle_quick_menu, {})
vim.keymap.set('n', '<leader>J', harpoon_mark.add_file, {})
vim.keymap.set('n', '<leader>1', function() harpoon_ui.nav_file(1) end, {})
vim.keymap.set('n', '<leader>2', function() harpoon_ui.nav_file(2) end, {})
vim.keymap.set('n', '<leader>3', function() harpoon_ui.nav_file(3) end, {})
vim.keymap.set('n', '<leader>4', function() harpoon_ui.nav_file(4) end, {})
require('telescope').setup {
    defaults = {
        layout_strategy = 'center',
        layout_config = { width = 0.95, height = 0.95, prompt_position = 'bottom' },
        wrap_results = false,
        border = false,
    },
}

harpoon.setup({
    global_settings = {
        -- sets the marks upon calling `toggle` on the ui, instead of require `:w`.
        save_on_toggle = true,
        -- saves the harpoon file upon every change. disabling is unrecommended.
        save_on_change = true,
        -- sets harpoon to run the command immediately as it's passed to the terminal when calling `sendCommand`.
        enter_on_sendcmd = true,
        -- filetypes that you want to prevent from adding to the harpoon list menu.
        -- set marks specific to each git branch inside git repository
        mark_branch = false,
    }
})


require 'nvim-treesitter.configs'.setup {
    -- A list of parser names, or "all"
    ensure_installed = { "rust" },

    -- Install parsers synchronously (only applied to `ensure_installed`)
    sync_install = false,

    -- Automatically install missing parsers when entering buffer
    -- Recommendation: set to false if you don't have `tree-sitter` CLI installed locally
    auto_install = false,

    highlight = {
        -- `false` will disable the whole extension
        enable = true,

        -- Setting this to true will run `:h syntax` and tree-sitter at the same time.
        -- Set this to `true` if you depend on 'syntax' being enabled (like for indentation).
        -- Using this option may slow down your editor, and you may see some duplicate highlights.
        -- Instead of true it can also be a list of languages
        additional_vim_regex_highlighting = false,
    },
}
