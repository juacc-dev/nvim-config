-- Comment stuff with "gc<something>" keypams.
-- Requires a treesitter parser to work.
-- For unssuported filetypes, check the repo readme.
return {
    "numToStr/Comment.nvim",
    event = { "BufReadPre", "InsertEnter" },
    opts = {
        -- Ignore blank lines
        ignore = "^$",
    },
}
