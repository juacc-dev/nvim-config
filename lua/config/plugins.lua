-- Declare lazy.nvim options before doing anything
local lazy_opts = {
    install = {
        colorscheme = {"default"},
    },
    ui = {
        -- I don't like icons they don't look great alongside bitmap fonts
        icons = require("data.lazy_icons"),
    },
}

-- lazy.nvim plugin manager
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"

-- Check if lazy is installed
if vim.loop.fs_stat(lazypath) then
    -- open lazy menu
    vim.keymap.set("n", "<leader>P", vim.cmd.Lazy)

    vim.opt.rtp:prepend(lazypath)

    require("lazy").setup("plugins", lazy_opts)

    return
else
    -- If lazy is not installed don't install it right away,
    -- you may just not need it right away.
    function Install_plugins()
        print("Installing lazy.nvim! Please wait")

        vim.fn.system({
            "git",
            "clone",
            "--filter=blob:none",
            "https://github.com/folke/lazy.nvim.git",
            "--branch=stable", -- Latest stable release
            lazypath,
        })

        vim.opt.rtp:prepend(lazypath)
        require("lazy").setup("plugins", lazy_opts)
    end

    -- Some highlights for when there is no colorscheme
    -- i think it doesn't work
    vim.opt.termguicolors = false
    vim.cmd([[
    hi SignColumn NONE
    hi CursorLine ctermbg=0 cterm=NONE
    hi CursorLineNr ctermbg=0 cterm=NONE
    hi StatusLine NONE
    hi TabLineFill NONE
    hi TabLineSel NONE
    ]])

    -- Same as `:lua install_lazy`_
    vim.keymap.set("n", "<leader>P", Install_plugins)

    print("<insert>Hello, world!<Esc>:wq<cr> Press \" P\" to install plugins.")
end
