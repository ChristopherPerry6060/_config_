local lsp = require("lsp-zero")

lsp.preset("recommended")

local cmp = require('cmp')
local cmp_select = {behavior = cmp.SelectBehavior.Select}
local cmp_mappings = lsp.defaults.cmp_mappings({
  ['<C-p>'] = cmp.mapping.select_prev_item(cmp_select),
  ['<C-n>'] = cmp.mapping.select_next_item(cmp_select),
  ['<C-y>'] = cmp.mapping.confirm({ select = true }),
  ["<C-Space>"] = cmp.mapping.complete(),
})


lsp.setup_nvim_cmp({
  mapping = cmp_mappings
})

lsp.set_preferences({
    suggest_lsp_servers = false,
    sign_icons = {
        error = 'E',
        warn = 'W',
        hint = 'H',
        info = 'I'
    }
})

lsp.on_attach(function(client, bufnr)
  local opts = {buffer = bufnr, remap = false}
  -- showing: [l]anguage [s]howing
  -- go to: [l]anguage [g]o

  vim.keymap.set("n", "<leader>d", function() vim.lsp.buf.definition() end, opts)
  vim.keymap.set("n", "<leader>k", function() vim.lsp.buf.hover() end, opts)
  vim.keymap.set("n", "<leader>a", function() vim.lsp.buf.code_action() end, opts)
  vim.keymap.set("n", "<leader>r", function() vim.lsp.buf.rename() end, opts)
  vim.keymap.set("n", "<leader>F", function() vim.lsp.buf.format { async = true } end, opts)
  vim.keymap.set("i", "<C-h>", function() vim.lsp.buf.signature_help() end, opts)
end)

lsp.setup()

vim.diagnostic.config({
    virtual_text = false,
    update_in_insert = true,
    underline = false,
    signs = false,
    float = {
        focusable = false,
        style = 'minimal',
        border = 'none',
        source = 'always',
        header = '',
        prefix = '',
  },
})
