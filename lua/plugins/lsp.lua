-- This was done with a lot of help from lsp-zero's migrate away guide:
-- https://github.com/VonHeikemen/lsp-zero.nvim/

-- There is no server specific configuration in here, this is only lspconfig
-- and mason.
-- Language settings are in 'plugins/lsp/settings.lua'.

local lspconfig = {
    "neovim/nvim-lspconfig",

    cmd = { "LspInfo" },

    event = { "BufReadPre", "BufNewFile" },

    dependencies = {
        { "hrsh7th/nvim-cmp" },
        { "williamboman/mason.nvim" },
    },

    config = function()
        -- I don't like how virtual text looks, I prefer asking for the
        -- diagnostics and having them in a floating window
        vim.diagnostic.config({ virtual_text = false })

        -- Diagnostics are not exclusive to lsp servers
        vim.keymap.set("n", "<leader>ld", vim.diagnostic.open_float)
        vim.keymap.set("n", "[l", vim.diagnostic.goto_next)
        vim.keymap.set("n", "]l", vim.diagnostic.goto_prev)

        vim.api.nvim_create_autocmd('LspAttach', {
            group = vim.api.nvim_create_augroup('UserLspConfig', {}),
            desc = "LSP keymaps",
            callback = function(event)
                -- Buffer-local keymaps
                local opts = { buffer = event.buf }

                vim.keymap.set("n", "K", vim.lsp.buf.hover, opts)
                vim.keymap.set("n", "gd", vim.lsp.buf.definition, opts)
                vim.keymap.set("n", "gD", vim.lsp.buf.declaration, opts)
                vim.keymap.set("n", "gi", vim.lsp.buf.implementation, opts)
                vim.keymap.set("n", "go", vim.lsp.buf.type_definition, opts)
                vim.keymap.set("n", "gr", vim.lsp.buf.references, opts)
                vim.keymap.set("n", "<leader>lr", vim.lsp.buf.rename, opts)
                vim.keymap.set("n", "<leader>la", vim.lsp.buf.code_action, opts)
                -- Run formatter
                vim.keymap.set(
                    { "n", "v", "x" },
                    "<leader>lf",
                    function()
                        vim.lsp.buf.format({ async = true })
                    end,
                    opts
                )
                vim.keymap.set("i", "<C-s>", vim.lsp.buf.signature_help, opts)
            end
        })
    end
}

-- Package manager for LSP servers and dependencies
local mason = {
    "williamboman/mason.nvim",

    cmd = { "Mason" },
    keys = { { "<leader>lm", vim.cmd.Mason }, desc = "Mason" },

    dependencies = {
        { "neovim/nvim-lspconfig" },
    },

    build = function()
        vim.cmd("MasonUpdate")
    end,

    opts = {
        ui = {
            icons = {
                package_installed = ">",
                package_pending = "...",
                package_uninstalled = "X",
            },
        },
    },
}

local mason_lspconfig = {
    "williamboman/mason-lspconfig.nvim",

    dependencies = {
        { "neovim/nvim-lspconfig" },
        { "williamboman/mason.nvim" },
    },

    -- mason-lspconfig need to be setup after mason.
    opts = {
        -- For clangd, I have $HOME/.clang-format for customizing the
        -- formatter.
        ensure_installed = {
            -- C
            "clangd",

            -- Lua
            "lua_ls",

            -- Python
            "pylsp",
        },

        -- This sets up handlers for different lsp servers.
        -- I have a special function that works for all servers, it sets
        -- completion capabilities and looks for settings inside of
        -- 'plugins/lsp/'
        -- This is the same as doing smth like `lsp.<server_name>.setup({...})`
        -- manually for each available.
        -- `:h mason-lspconfig.setup_hanlders()` for more info.
        handlers = {
            function(server_name)
                require("lspconfig")[server_name].setup({
                    -- Completion capabilities. More info on the github page.
                    capabilities = require('cmp_nvim_lsp').default_capabilities(),

                    -- If there is a configuration for the server, use it.
                    -- otherwise, nothing special happens.
                    settings = require("plugins.lsp.settings")[server_name]
                })
            end,
        },
    },
}

return { lspconfig, mason, mason_lspconfig }
