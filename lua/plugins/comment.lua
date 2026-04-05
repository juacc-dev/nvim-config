-- Comment stuff with "gc"
return {
    "numToStr/Comment.nvim",
    event = { "BufReadPre", "InsertEnter" },
    opts = {
        -- Ignore blank lines
        ignore = "^$",
    },
}
