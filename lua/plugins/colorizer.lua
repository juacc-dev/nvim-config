-- Colorize color codes
return {
    "catgoose/nvim-colorizer.lua",

    event = "BufReadPre",

    keys = {
        { "<leader>lc", vim.cmd.ColorizerReloadAllBuffers },
        desc = "Reload colorizer"
    },

    config = function()
        vim.opt.termguicolors = true

        require("colorizer").setup({
            options = {
                parsers = {
                    names = {
                        enable = false, -- enable named colors (e.g. "Blue")
                    },
                    hex = {
                        hash_aarrggbb = true, -- #AARRGGBB (QML-style, alpha first)
                        aarrggbb = true, -- 0xAARRGGBB
                    },
                    rgb = { enable = true }, -- rgb()/rgba() functions
                    hsl = { enable = true }, -- hsl()/hsla() functions
                    xterm = { enable = true }, -- xterm 256-color codes (#xNN, \e[38;5;NNNm)
                    css_var_rgb = { enable = true }, -- CSS vars with R,G,B (e.g. --color: 240,198,198)
                },
                display = {
                    mode = "background", -- string or list: "background"|"foreground"|"underline"|"virtualtext"
                    background = {
                        bright_fg = "#1d2021", -- text color on bright backgrounds
                        dark_fg = "#ebdbb2", -- text color on dark backgrounds
                    },
                },
            },
        })
    end,
}
