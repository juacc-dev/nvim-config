-- For friendly-snippets (VS Code-like)
require("luasnip.loaders.from_vscode").lazy_load({
    exclude = { "tex", "c", "cpp" },
})

-- Load custom lua snippets
require("luasnip.loaders.from_lua").lazy_load({
    paths = "~/.config/nvim/lua/snippets"
})

require("luasnip").config.set_config({
    -- Remember to keep around the last snippet
    history = true,

    -- Autoexpand some snippets
    enable_autosnippets = true,

    -- Dynamic snippets that update while typing
    updateevents = "TextChanged,TextChangedI",

    -- This is for pasting selected text inside of a snippet
    store_selection_keys = "<C-s>",
})
