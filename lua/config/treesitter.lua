-- This are the filetypes for which a parser is installed.
-- Parsers can be installed using the system package manager (e.g.
-- `tree-sitter-python` in Arch Linux) or manually.
local filetypes = {
    "c",
    "lua",
    "python",
    "markdown",
    "bash",
    "markdown_inline",
    "vim",
    "vimdoc",
    "make",
    "ledger",
    "nix",
}

-- To fix mapping between parser name 'bash' and  filetype 'sh'
vim.treesitter.language.register("bash", "sh")

vim.api.nvim_create_autocmd("FileType", {
    pattern = filetypes,
    callback = function()
        vim.treesitter.start()
    end
})
