vim.opt_local.spelllang = "en,es"
vim.opt_local.spell = true
vim.opt_local.conceallevel = 0
vim.opt.sidescrolloff = 0

vim.g["pencil#wrapModeDefault"] = "hard"
vim.g["pencil#autoformat"] = 0

-- Automatically insert "\item" in newline when inside of itemize or enumerate.
-- It doesn't work that well
-- local function new_item()
--     local in_itemize = vim.fn.searchpair("begin{itemize}", "", "end{itemize}")
--     local in_enumerate = vim.fn.searchpair("begin{enumerate}", "", "end{enumerate}")

--     if in_itemize + in_enumerate > 0 then
--         return "\r\\item "
--     else
--         return "\r"
--     end
-- end

-- vim.keymap.set("i", "<CR>", new_item, { buffer = true, expr = true })

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
