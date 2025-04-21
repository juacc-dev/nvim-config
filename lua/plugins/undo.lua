-- undo tree
-- local undo = {
--     "simnalamburt/vim-mundo",

--     keys = { { "<leader>u", vim.cmd.MundoToggle }, desc = "Undo tree" },

--     init = function()
--         vim.g.mundo_width = 30
--         vim.g.mundo_preview_height = 10
--         vim.g.mundo_preview_bottom = 1
--         vim.g.mundo_playback_delay = 33
--     end
-- }

local undo = {
    "mbbill/undotree",
    lazy = false,
}

return undo
