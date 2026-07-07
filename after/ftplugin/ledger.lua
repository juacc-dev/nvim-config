local opts = { remap = true, buffer = true }
vim.keymap.set("n", "<C-w>d", vim.cmd["LedgerAlignBuffer"], opts)
