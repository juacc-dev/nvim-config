-- Is this too much?
-- It's definitely not too little.
-- It takes about the same time to load as the rest of the config

vim.pack.add({
    -- Language server
    "https://github.com/neovim/nvim-lspconfig",

    -- Looks
    "https://github.com/ellisonleao/gruvbox.nvim",
    "https://github.com/catgoose/nvim-colorizer.lua",

    -- Filetype-specific (sort of)
    "https://github.com/lervag/vimtex",        -- LaTeX
    "https://github.com/preservim/vim-pencil", -- Prose writing
    "https://github.com/tpope/vim-fugitive",   -- Git
    "https://github.com/ledger/vim-ledger",    -- ledger and hledger

    -- Completion
    "https://github.com/hrsh7th/nvim-cmp",
    "https://github.com/hrsh7th/cmp-nvim-lsp",
    "https://github.com/hrsh7th/cmp-buffer",
    "https://github.com/hrsh7th/cmp-path",
    "https://github.com/hrsh7th/cmp-cmdline",
    "https://github.com/hrsh7th/cmp-nvim-lua",
    "https://github.com/saadparwaiz1/cmp_luasnip",
    "https://github.com/micangl/cmp-vimtex",

    -- Snippets
    "https://github.com/L3MON4D3/LuaSnip",

    -- General utilities
    "https://github.com/mbbill/undotree",
    "https://github.com/windwp/nvim-autopairs",

    -- Fuzzy finder
    "https://github.com/nvim-telescope/telescope.nvim",
    "https://github.com/nvim-lua/plenary.nvim",

    -- Debugger. This is only loaded for some specific filetypes in
    -- 'after/ftplugin'.
    "https://github.com/mfussenegger/nvim-dap",
    "https://github.com/rcarriga/nvim-dap-ui",
    "https://github.com/nvim-neotest/nvim-nio", -- asynchronious IO
    "https://github.com/mfussenegger/nvim-dap-python",
})

require("plugins.ledger")
require("plugins.vimtex")

require("plugins.colorizer")
require("plugins.luasnip")
require("plugins.cmp")
require("plugins.gruvbox")
require("plugins.undotree")
require("plugins.autopairs")
require("plugins.telescope")
