-- This file loads:
--
-- VimTex
-- vim-pencil

return {
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
                layers = { "content", "todo" },
                show_help = 0
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
