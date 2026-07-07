vim.g["ledger_maxwidth"] = 80
vim.g["ledger_align_at"] = 40
vim.g["ledger_decimal_sep"] = ","
vim.g["ledger_default_commodity"] = "ARS"

local opts = { remap = true, buffer = true }
vim.keymap.set("n", "<leader>lf", vim.cmd["LedgerAlignBuffer"], opts)
