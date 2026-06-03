return {
    "nvim-treesitter/nvim-treesitter",
    lazy = false,
    build = ":TSUpdate",
    config = function()
        local parsers = {
            "c",
            "lua",
            "python",
            "bash",
            "markdown",
            "markdown_inline",
            "nix",
            "latex",
            "ledger",
        }

        require("nvim-treesitter").install(parsers)

        vim.api.nvim_create_autocmd("FileType", {
            pattern = parsers,
            callback = function()
                vim.treesitter.start()
                vim.bo.indentexpr = ""
            end
        })
    end
}
