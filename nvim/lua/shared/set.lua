-- Insert two lines
vim.keymap.set("n", "<leader>oO", "O<esc><Plug>Ysurroundiw}", {})
vim.keymap.set("n", "<leader>oo", "o<esc><Plug>Ysurroundiw}", {})
vim.keymap.set("n", "<leader>q", "@q", {})
vim.keymap.set("n", "<leader>A", "gg0vG$", {})


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
