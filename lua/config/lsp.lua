-- I don't like how virtual text looks, I prefer asking for the
-- diagnostics and having them in a floating window
-- vim.diagnostic.config({ virtual_text = false })

-- Diagnostics are not exclusive to lsp servers
-- vim.keymap.set("n", "]l", vim.diagnostic.jump({ opts = {count=1} }))

vim.api.nvim_create_autocmd('LspAttach', {
    group = vim.api.nvim_create_augroup('UserLspConfig', {}),
    desc = "LSP keymaps",
    callback = function(event)
        -- Buffer-local keymaps
        local opts = { buffer = event.buf }

        -- Run formatter
        vim.keymap.set(
            { "n", "v", "x" },
            "<leader>lf",
            function()
                vim.lsp.buf.format({ async = true })
            end,
            opts
        )
    end
})

vim.lsp.enable({
    "lua_ls",
    "pylsp",
    "ruff",
    "texlab",
    "clangd",
})
