vim.opt.backup = false
vim.opt.swapfile = false
vim.opt.undofile = true
vim.opt.writebackup = false

vim.opt.mouse = "a"
vim.opt.clipboard = "unnamedplus"

vim.opt.textwidth = 80
vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.shiftwidth = 4
vim.opt.showtabline = 1
vim.opt.smartindent = true
-- spaces instead of tabs
vim.opt.expandtab = true

-- don't highlight all matches
vim.opt.hlsearch = false
-- default case insensitive search
vim.opt.ignorecase = true
vim.opt.smartcase = true

-- highlight current line
vim.opt.cursorline = true

vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.signcolumn = "yes"

vim.opt.scrolloff = 8
vim.opt.sidescrolloff = 8

-- don't wrap lines (this is overriden for some filetypes in 'after/ftplugin')
vim.opt.wrap = false

-- Max number of elements to show in pop up menus
vim.opt.pumheight = 24

-- This is relevant for swap files (which I don't use) and the CursorHold event
vim.opt.updatetime = 476

vim.opt.splitbelow = true

vim.g.python3_host_prog = "/usr/bin/python3"

-- Make neovim assume that .h files are C (not C++) headers
vim.g.c_syntax_for_h = 1
