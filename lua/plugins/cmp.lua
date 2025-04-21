local cmp_nvim = {
    "hrsh7th/nvim-cmp",

    event = { "InsertEnter", "CmdlineEnter" },

    dependencies = {
        { "hrsh7th/cmp-nvim-lsp" },
        { "hrsh7th/cmp-buffer" },
        { "hrsh7th/cmp-path" },
        { "hrsh7th/cmp-nvim-lua" },
        { "micangl/cmp-vimtex" },
        { "L3MON4D3/LuaSnip" },
        { "saadparwaiz1/cmp_luasnip" },
    },

    config = function()
        local cmp = require("cmp")
        local luasnip = require("luasnip")

        -- cmp is enabled by default
        local enable_toggle = true
        -- But it can be disabled (toggled) by with this keymap if you wanted to
        vim.keymap.set("n", "<leader>C",
            function()
                enable_toggle = not enable_toggle
                cmp.setup({ enabled = enable_toggle })

                if enable_toggle then
                    print("Completion enabled")
                else
                    print("Completion disabled")
                end
            end)

        require("data.cmp_hl")()

        cmp.setup({
            mapping = {
                ["<C-k>"] = cmp.mapping(function(fallback)
                    if luasnip.expandable() then
                        luasnip.expand()
                    elseif cmp.visible() then
                        cmp.confirm()
                    else
                        fallback()
                    end
                end),

                ["<C-p>"] = cmp.mapping.select_prev_item(),
                ["<C-n>"] = cmp.mapping.select_next_item(),

                ["<C-b>"] = cmp.mapping.abort(),

                -- Navigate documentation
                ["<C-u>"] = cmp.mapping.scroll_docs(-4),
                ["<C-d>"] = cmp.mapping.scroll_docs(4),

                -- Trigger completion menu
                ["<C-Space>"] = cmp.mapping.complete(),

                -- LuaSnip-related mappings

                -- Jump to next placeholder
                ["<Tab>"] = cmp.mapping(function(fallback)
                    if luasnip.jumpable(1) then
                        luasnip.jump(1)
                    else
                        fallback()
                    end
                end, { "i", "s" }),

                -- Jump to previous placeholder
                ["<S-Tab>"] = cmp.mapping(function(fallback)
                    if luasnip.jumpable(-1) then
                        luasnip.jump(-1)
                    else
                        fallback()
                    end
                end, { "i", "s" }),

                -- Cycle through choices in luasnip (I love this)
                ["<C-c>"] = cmp.mapping(function(fallback)
                    if luasnip.choice_active() then
                        luasnip.change_choice(1)
                    else
                        fallback()
                    end
                end, { "i", "s" }),
            },

            window = {
                -- Limit docs size
                documentation = { max_height = 32, max_width = 32, },
            },

            snippet = {
                expand = function(args)
                    -- LuaSnip specific
                    require("luasnip").lsp_expand(args.body)
                end,
            },

            sources = {
                { name = "luasnip",    keyword_length = 2 },
                { name = "nvim_lsp" },
                -- { name = "cmp-vimtex", keyword_length = 2 },
                { name = "buffer",     keyword_length = 4 },
                { name = "path" },
                { name = "nvim_lua" }, -- Lua for nvim
            },

            formatting = {
                fields = { "abbr", "kind", "menu" },
                format = function(entry, item)
                    -- Text instead of icons in completion menu
                    item.kind = require("data.cmp_icons")[item.kind]

                    -- Limit cmp window width
                    local content = item.abbr
                    local W_MAX = 20
                    if #content > W_MAX then
                        item.abbr = vim.fn.strcharpart(content, 0, W_MAX) .. "..."
                    else
                        item.abbr = content .. (" "):rep(W_MAX - #content)
                    end

                    local short_name = {
                        nvim_lsp = "lsp",
                        luasnip  = "ls",
                        vimtex   = "TeX",
                        buffer   = "%",
                        path     = "./",
                        nvim_lua = "vim",
                    }

                    local menu_name = short_name[entry.source.name] or nil
                    item.menu = string.format("[%s]", menu_name)

                    return item
                end,
            },

            -- Preselect first item
            preselect = "item",
            completion = {
                completeopt = "menu,menuone,noinsert",
            },
        })

        cmp.setup.filetype("tex", {
            sources = {
                { name = "luasnip", keyword_length = 2 },
                { name = "vimtex",  keyword_length = 2 },
                { name = "buffer",  keyword_length = 4 }
            }
        })
    end
}

local snippets = {
    -- I use LuaSnip as my snippet engine. It allows for powerful custom snippets
    -- written in lua.
    -- I did this with a lot of help from TJ videos about this plugin:
    -- https://youtu.be/Dn800rlPIho


    "L3MON4D3/LuaSnip",

    event = { "InsertEnter", "CmdlineEnter" },

    -- I don't really like these
    dependencies = {{ "rafamadriz/friendly-snippets" }},

    build = "make install_jsregexp",

    version = "v2.*",

    config = function()
        -- For friendly-snippets (VS Code-like)
        require("luasnip.loaders.from_vscode").lazy_load({
            exclude = { "latex", "c", "cpp" },
        })

        -- Load custom lua snippets
        require("luasnip.loaders.from_lua").lazy_load({
            paths = "~/.config/nvim/lua/snippets"
        })

        local luasnip = require("luasnip")

        luasnip.config.set_config({
            -- Remember to keep around the last snippet
            history = true,

            -- Autoexpand some snippets
            enable_autosnippets = true,

            -- Dynamic snippets that update while typing
            updateevents = "TextChanged,TextChangedI",

            -- This is for pasting selected text inside of a snippet
            store_selection_keys = "<C-s>",
        })
    end
}

return { cmp_nvim, snippets }
