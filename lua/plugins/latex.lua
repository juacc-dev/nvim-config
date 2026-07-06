return {
    "lervag/vimtex",
    ft = { "tex" },
    lazy = false,
    init = function()
        vim.g.vimtex_view_method = "zathura"
        vim.g.vimtex_compiler_method = "latexmk"
        vim.g.vimtex_compiler_latexmk = {
            aux_dir = "./.build",
        }
        vim.g.vimtex_compiler_latexmk_engines = {
            ["_"] = "-lualatex",
            ["xelatex"] = "-xelatex",
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
    end
}
