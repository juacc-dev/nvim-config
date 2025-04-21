-- I use space as my leader key
vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- Easier write
vim.keymap.set("n", ";w", ":w<cr>")

-- Open the netrw file explorer
vim.keymap.set("n", "<leader>e", ":Explore<CR>")

-- Window navigation (normal and terminal mode)
vim.keymap.set({ "n", "t" }, "<C-h>", "<C-w>h")
vim.keymap.set({ "n", "t" }, "<C-j>", "<C-w>j")
vim.keymap.set({ "n", "t" }, "<C-k>", "<C-w>k")
vim.keymap.set({ "n", "t" }, "<C-l>", "<C-w>l")

-- Window size
vim.keymap.set({ "n", "t" }, "<C-A-h>", ":vertical resize -2<CR>")
vim.keymap.set({ "n", "t" }, "<C-A-j>", ":resize +2<CR>")
vim.keymap.set({ "n", "t" }, "<C-A-k>", ":resize -2<CR>")
vim.keymap.set({ "n", "t" }, "<C-A-l>", ":vertical resize +2<CR>")

-- Buffers
vim.keymap.set("n", "<leader>q", vim.cmd.bdelete)
vim.keymap.set("n", "<S-l>", vim.cmd.bnext)
vim.keymap.set("n", "<S-h>", vim.cmd.bprevious)

-- Move text up and down
vim.keymap.set("n", "<A-j>", "<Esc>:m .+1<CR>==")
vim.keymap.set("n", "<A-k>", "<Esc>:m .-2<CR>==")


-- ## Visual mode ## --

-- Paste from the 0 register, which contains the pasted text but not the one
-- replaced. The replaced text is yanked normally.
vim.keymap.set({ "n", "v", "x" }, "<leader>p", '"0p')
-- There are some other useful mappings for pasting:
-- - "]p": which is like "p" but adjusts indent to the current line
-- - "[p": the same but with "P".

-- For indenting
vim.keymap.set("v", "<", "<gv")
vim.keymap.set("v", ">", ">gv")

-- Move text up and down
vim.keymap.set("v", "<A-k>", ":move .-2<CR>==")
vim.keymap.set("v", "<A-j>", ":move .+1<CR>==")

-- Move text up and down
vim.keymap.set("x", "J", ":move '>+1<CR>gv-gv")
vim.keymap.set("x", "K", ":move '<-2<CR>gv-gv")
vim.keymap.set("x", "<A-j>", ":move '>+1<CR>gv-gv")
vim.keymap.set("x", "<A-k>", ":move '<-2<CR>gv-gv")
