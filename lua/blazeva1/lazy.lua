-- plugin loader 'lazy.nvim' https://github.com/folke/lazy.nvim
-- the following sets it up and installs it if not installed
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
    vim.fn.system({
        "git",
        "clone",
        "--filter=blob:none",
        "https://github.com/folke/lazy.nvim.git",
        "--branch=stable", -- latest stable release
        lazypath,
    })
end
vim.opt.rtp:prepend(lazypath)

-- list plugins that should be installed
-- lazy installes them automatically on opening nvim
require('lazy').setup({
    {'nvim-telescope/telescope.nvim',
        dependencies = { 'nvim-lua/plenary.nvim' }
        -- sudo apt install ripgrep
    },
    {'lukas-reineke/indent-blankline.nvim'},
    {'tpope/vim-fugitive'},         -- :Git integration
    {'godlygeek/tabular'},          -- :Tab /<with what>
    {'vimwiki/vimwiki'},            -- local wiki under '<leader>ww'
    {'scrooloose/nerdcommenter'},   -- use 'gc' to comment/uncomment
    {'ap/vim-css-color'},           -- inline highlight of #FF000 colors
    {'L3MON4D3/LuaSnip'},           -- snippets
    {                               -- LaTeX support
        'lervag/vimtex',
        lazy = false,
    },
    {'nvim-treesitter/nvim-treesitter', build=':TSUpdate'}, -- incremental parser (official)
    {'nvim-treesitter/playground'}, -- see parser tree by :TSPlaygroundToggle
    {'rose-pine/neovim', name='rose-pine'},           -- theme
    {'mbbill/undotree'},            -- nice undo tree
    {'eandrju/cellular-automaton.nvim'},
    {
        'VonHeikemen/lsp-zero.nvim',
        branch = 'v2.x',
        dependencies = {
            -- LSP Support
            {'neovim/nvim-lspconfig'},             -- Required
            {                                      -- Optional
            'williamboman/mason.nvim',
                build = function()
                    pcall(vim.cmd, 'MasonUpdate')
                end,
            },
            {'williamboman/mason-lspconfig.nvim'}, -- Optional

            -- Autocompletion
            {'hrsh7th/nvim-cmp'},     -- Required
            {'hrsh7th/cmp-nvim-lsp'}, -- Required
            {'L3MON4D3/LuaSnip'},     -- Required
        }
    }
})
