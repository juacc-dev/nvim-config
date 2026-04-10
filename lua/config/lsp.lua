-- I don't like how virtual text looks, I prefer asking for the
-- diagnostics and having them in a floating window
-- vim.diagnostic.config({ virtual_text = false })

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

vim.lsp.enable({
    "lua_ls",
    "pylsp",
    "texlab",
})
