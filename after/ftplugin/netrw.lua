-- Apparently netrw counts as a filetype

vim.g.netrw_keepdir = 0
vim.g.netrw_localcopydircmd = "cp -r"
vim.g.netrw_banner = 0
vim.g.netrw_winsize = 30
vim.g.netrw_list_hide = [[\(^\|\s\s\)\zs\.\S\+,.*\.aux,.*\.log,.*\.fls,.*\.toc,.*\.fdb_latexmk,.*\.synctex.gz]]

-- This is for better navigation inside netrw. I followed this guide:
-- https://vonheikemen.github.io/devlog/tools/using-netrw-vim-builtin-file-explorer/

local opts = { remap = true, buffer = true }

vim.keymap.set("n", "<Esc>",   vim.cmd.bdelete, opts) -- Exit
vim.keymap.set("n", "h",       "-^",            opts) -- Go up
vim.keymap.set("n", "l",       "<CR>",          opts) -- Open file or enter dir
vim.keymap.set("n", ".",       "gh",            opts) -- Hidden files
vim.keymap.set("n", "P",       "<C-w>z",        opts) -- close preview ('p' to open)
vim.keymap.set("n", "<tab>",   "mf",            opts) -- mark (or unmark) a file
vim.keymap.set("n", "<S-tab>", "mF",            opts) -- unmark all in current buffer
vim.keymap.set("n", "<A-tab>", "mu",            opts) -- unmark all
