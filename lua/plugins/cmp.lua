-- This file loads:
--
-- nvim-cmp
-- LuaSnip

local ok, plugin = pcall(require, "cmp")
if not ok then
    return
end

local cmp = plugin
local luasnip = require("luasnip")

vim.lsp.config("*", {
    capabilities = require("cmp_nvim_lsp").default_capabilities()
})

local cmp_enabled = true
local function toggle_functionality()
    cmp_enabled = not cmp_enabled
    cmp.setup({ enabled = cmp_enabled })

    if cmp_enabled then
        print("Completion enabled")
    else
        print("Completion disabled")
    end
end

vim.keymap.set("n", "<leader>C", toggle_functionality)

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
        { name = "luasnip", keyword_length = 2 },
        { name = "nvim_lsp" },
        -- { name = "cmp-vimtex", keyword_length = 2 },
        { name = "buffer",  keyword_length = 4 }, -- From text in the buffer
        { name = "path" },                        -- From paths in filesystem
        { name = "nvim_lua" },                    -- Lua for nvim
        { name = "vimtex" },
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
