-- Highlight for nvim-cmp

-- `:h cmp-highlight for more info`

local palette = require("data.palette")

local highlights = {
    ["CmpItemAbbr"] = {
        fg = palette["alt fg"],
    },

    ["CmpItemAbbrDeprecated"] = {
        fg = palette["red"],
        strikethrough = true,
    },

    ["CmpItemAbbrMatch"] = {
        fg = palette["green"],
        bold = true,
        underdashed = true,
    },

    ["CmpItemAbbrMatchFuzzy"] = {
        fg = palette["green"],
        underdotted = true,
    },

    ["CmpItemKindSnippet"] = {
        fg = palette["magenta"],
        bold = true,
    },

    ["CmpItemKindKeyword"] = {
        fg = palette["bri red"],
    },

    ["CmpItemKindFunction"] = {
        fg = palette["yellow"],
        bold = true,
    },

    ["CmpItemKindInterface"] = {
        fg = palette["blue"],
        bold = true,
    },
}

local hl = vim.api.nvim_set_hl

return function()
    for group, color in pairs(highlights) do
        hl(0, group, color)
    end
end
