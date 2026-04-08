-- Prose oriented editing
return {
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
}
