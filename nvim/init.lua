vim.g.mapleader = " "

require('home_setup.colors')
require('shared.set')
-- Only required if you have packer configured as `opt`

return require('packer').startup(function(use)
    -- Lua
    use('kdheepak/lazygit.nvim')
    use('wbthomason/packer.nvim')
    use('Canop/nvim-bacon')
    use('tpope/vim-surround')
    use('ThePrimeagen/harpoon')
    use('lukas-reineke/indent-blankline.nvim')
    use('nvim-treesitter/playground')
    use('vimwiki/vimwiki')

    use { 'nvim-treesitter/nvim-treesitter', run = ':TSUpdate' }
    use { 'catppuccin/nvim', as = 'catppuccin' }
    -- -- Telescope related
    use { 'nvim-telescope/telescope.nvim', tag = '0.1.1',
        requires = { { 'nvim-lua/plenary.nvim' } }
    }
    use { 'nvim-telescope/telescope-file-browser.nvim' }

    -- -- LSP
    use {
        'VonHeikemen/lsp-zero.nvim',
        requires = {
            -- LSP Support
            { 'neovim/nvim-lspconfig' },
            { 'williamboman/mason.nvim' },
            { 'williamboman/mason-lspconfig.nvim' },
            -- Autocompletion
            { 'hrsh7th/nvim-cmp' },
            { 'hrsh7th/cmp-buffer' },
            { 'hrsh7th/cmp-path' },
            { 'saadparwaiz1/cmp_luasnip' },
            { 'hrsh7th/cmp-nvim-lsp' },
            { 'hrsh7th/cmp-nvim-lua' },
            -- Snippets
            { 'L3MON4D3/LuaSnip' },
            { 'rafamadriz/friendly-snippets' },
        }
    }
end)
