-- Comment stuff with "gc<something>" keypams.
-- Requires a treesitter parser to work.
-- For unssuported filetypes, check the repo readme.

require("Comment").setup({
    -- Ignore blank lines
    ignore = "^$",
})
