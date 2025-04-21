-- Each language server can be configured via the settings field in their setup,
-- That is, into `require("lspconfig")["lua_ls"].setup() for example.`
-- Since I'm using mason-lspconfig, I use the handlers table. More info at
-- `:h mason-lspconfig.setup_hanlders()`.

-- For more info on server configurations, look at `:h lspconfig-all` or the
-- lspconfig github page.

local settings = {
    ["lua_ls"] = {
        Lua = {
            diagnostics = { globals = { "vim" } },
            runtime = { version = "LuaJIT", },
            workspace = {
                checkThirdParty = false,
                library = { vim.env.VIMRUNTIME }
            }
        },
    },

    ["pylsp"] = {
        pylsp = { plugins = {
            -- More info on https://pycodestyle.pycqa.org/en/latest/intro.html
            pycodestyle = {
                enabled = true,
                ignore = { 'E2', 'E3', 'E731'},
                maxLineLength = 80
            }
        } }
    },

    ["ltex"] = {
        ltex = {
            language = "es",
        },
    },
}

return settings
