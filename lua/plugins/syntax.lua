-- For all languages
local all = {
    {
        "nvim-treesitter/nvim-treesitter",

        event = { "BufReadPre", "BufNewFile" },

        build = ":TSUpdate",

        config = function()
            require 'nvim-treesitter.configs'.setup {
                -- A list of parser names, or "all"
                ensure_installed = {
                    "c", "lua", "python", "bash",
                    "markdown", "markdown_inline"
                },

                -- Install parsers synchronously (only applied to
                -- `ensure_installed`)
                sync_install = false,

                -- Recommendation: set to false if you don't have `tree-sitter`
                -- CLI installed locally
                auto_install = false,

                highlight = {
                    enable = true,

                    -- Disable TS for "large" files
                    disable = function(lang, buf)
                        local max_filesize = 787 * 1024 -- In bytes

                        local ok, stats = pcall(
                            vim.loop.fs_stat,
                            vim.api.nvim_buf_get_name(buf)
                        )

                        if ok and stats and stats.size > max_filesize then
                            print(string.format(
                                "File larger than %d KB! Disabling Treesitter.",
                                max_filesize / 1024
                            ))
                            return true
                        end
                    end,

                    -- Set this to `true` if you depend on 'syntax' being
                    -- enabled (like for indentation).
                    additional_vim_regex_highlighting = false,
                },

                indent = { enable = true },

                incremental_selection = {
                    enable = true,
                    keymaps = {
                        -- set to `false` to disable one of the mappings
                        init_selection = "gn",
                        node_incremental = "gn",
                        scope_incremental = false,
                        node_decremental = "gb",
                    },
                },
            }
        end
    },

    -- Colorize color codes
    {
        "norcalli/nvim-colorizer.lua",

        event = { "BufReadPre", "BufNewFile" },

        keys = {
            { "<leader>lc", vim.cmd.ColorizerReloadAllBuffers },
            desc = "Reload colorizer"
        },

        config = function()
            vim.opt.termguicolors = true

            require("colorizer").setup(
            -- Filetypes for which the plugin is enabled.
            -- They can have overrides for the global options
                { "*" },

                -- Options, they are documented in `:h colorizer-options`
                {
                    RGB      = true,
                    RRGGBB   = true,
                    names    = true,
                    RRGGBBAA = true,
                    rgb_fn   = false,
                    hsl_fn   = false,
                    css      = false,
                    css_fn   = false,
                    mode     = "background",
                }
            )
        end,
    },

    -- Comment stuff with "gc"
    {
        "numToStr/Comment.nvim",
        event = { "BufReadPre", "InsertEnter" },
        opts = {
            -- Ignore blank lines
            ignore = "^$",
        },
    },

    -- Automatically close parentheses and similar
    {
        "windwp/nvim-autopairs",
        event = "InsertEnter",
        opts = {},
    },
}

local language_specific = {
    -- LaTeX
    {
        "lervag/vimtex",
        ft = { "tex" },
        config = function()
            vim.g.vimtex_view_method = "zathura"
            vim.g.vimtex_compiler_method = "latexmk"
            vim.g.vimtex_compiler_latexmk = {
              aux_dir = "./.build",
            }
            vim.g.vimtex_compiler_latexmk_engines = {
                ["_"] = "-xelatex",
                ["pdflatex"] = "-pdf",
            }

            vim.g.vimtex_toc_config = {
                name = "Table of contents",
                split_pos = "vert rightbelow",
                split_width = 50,
                tocdepth = 4,
            }

            -- disable treesitter since it conflicts with vimtex
            require 'nvim-treesitter.configs'.setup({
                highlight = { enable = false, },
            })
        end
    },

    -- Prose oriented editing
    {
        "preservim/vim-pencil",

        ft = { "markdown", "tex" },

        config = function()
            -- g options should be set before calling Pencil.
            -- filetype specific config goes in 'after/ftplugin', they get
            -- loaded before this.

            -- Cursor wrapping is really anoying
            vim.g["pencil#cursorwrap"] = 0

            vim.cmd([[
                Pencil
                " set statusline=%<%f\ %h%m%r%w\ \ %{PencilMode()}\ %=\ col\ %c%V\ \ line\ %l\,%L\ %P
                " set rulerformat=%-12.(%l,%c%V%)%{PencilMode()}\ %P
            ]])
        end
    },
}

return { all, language_specific }
