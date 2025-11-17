-- This file loads:
--
-- undotree

-- I used to use vim-mundo

-- Some notes about undotree:
-- Press ? for help in the undotree window.
-- Markers:
-- > Every change has a sequence number and it is displayed before timestamps.
-- > The current state is marked as > number <.
-- > The next state which will be restored by :redo or <ctrl-r> is marked as
--   { number }.
-- > The [ number ] marks the most recent change.
-- > The undo history is sorted by timestamps.
-- > Saved changes are marked as s and the big S indicates the most recent
--   saved change.
return {
    "mbbill/undotree",
    lazy = false,
    keys = { { "<leader>u", vim.cmd.UndotreeToggle }, desc = "Undo tree" },
    init = function()
        vim.g.undotree_WindowLayout = 1
        vim.g.undotree_SplitWidth = 30
        vim.g.undotree_DiffpanelHeight = 10
        vim.g.undotree_SetFocusWhenToggle = 1
    end
}
