vim.keymap.set("n", "<leader>o", "2o<esc>b", {})
vim.keymap.set("n", "<leader>n", "\"_", {})
vim.keymap.set("n", "<leader>p", "\"*p", {})
vim.keymap.set("n", "<leader>P", "\"*P", {})
vim.keymap.set("n", "<leader>qq", ":bd<CR>", {})
vim.keymap.set("n", "<leader>w", "gt", {})
vim.keymap.set("n", "<leader>Wn", ":bn", {})
vim.keymap.set("n", "<leader>Wl", ":wincmd L", {})
vim.keymap.set("i", "jk", "<esc>", {})

vim.opt.nu = true
vim.opt.relativenumber = true
vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = true
vim.opt.smartindent = true
vim.opt.wrap = false
vim.opt.swapfile = false
vim.opt.backup = false
vim.opt.undofile = true
vim.opt.cursorline = true
vim.opt.colorcolumn = "80,100"
vim.opt.hlsearch = false
vim.opt.incsearch = true
vim.opt.termguicolors = true
vim.opt.scrolloff = 4
vim.opt.updatetime = 50
