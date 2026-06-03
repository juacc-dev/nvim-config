local opts = { remap = true, buffer = true }

vim.keymap.set("n", "<leader>lf", vim.cmd["LedgerAlignBuffer"], opts)
