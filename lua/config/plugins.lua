-- Is this too much?
-- It's definitely not too little.

vim.pack.add({
    -- Language server
    "https://github.com/neovim/nvim-lspconfig",

    -- Looks
    "https://github.com/ellisonleao/gruvbox.nvim",
    "https://github.com/catgoose/nvim-colorizer.lua",

    -- Completion
    "https://github.com/hrsh7th/nvim-cmp",
    "https://github.com/hrsh7th/cmp-nvim-lsp",
    "https://github.com/hrsh7th/cmp-buffer",
    "https://github.com/hrsh7th/cmp-path",
    "https://github.com/hrsh7th/cmp-cmdline",
    "https://github.com/hrsh7th/cmp-nvim-lua",

    -- Snippets
    "https://github.com/L3MON4D3/LuaSnip",
    "https://github.com/saadparwaiz1/cmp_luasnip",

    -- General utilities
    "https://github.com/mbbill/undotree",
    "https://github.com/windwp/nvim-autopairs",
    "https://github.com/numToStr/Comment.nvim",

    -- Fuzzy finder
    "https://github.com/nvim-telescope/telescope.nvim",
    "https://github.com/nvim-lua/plenary.nvim",

    -- Debugger. This is only loaded for some specific filetypes in
    -- 'after/ftplugin'.
    "https://github.com/mfussenegger/nvim-dap",
    "https://github.com/rcarriga/nvim-dap-ui",
    "https://github.com/nvim-neotest/nvim-nio", -- asynchronious IO
    "https://github.com/mfussenegger/nvim-dap-python",

    -- Filetype-specific (sort of)
    "https://github.com/lervag/vimtex",        -- LaTeX
    "https://github.com/preservim/vim-pencil", -- Prose writing
    "https://github.com/tpope/vim-fugitive",   -- Git
    "https://github.com/ledger/vim-ledger",    -- ledger and hledger

})

require("plugins.colorizer")
require("plugins.luasnip")
require("plugins.cmp")
require("plugins.comment")
require("plugins.gruvbox")
require("plugins.undotree")
require("plugins.autopairs")
require("plugins.telescope")
