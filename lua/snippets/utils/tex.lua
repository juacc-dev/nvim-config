-- LuaSnip has condition objects, which you can make with make_condition().
-- These allow to combine conditions by simple operators like '+' (OR),
-- '*' (AND), '-' (AND NOT), etc. More info at `:h luasnip-extras-conditions`

-- Convert a function into a LuaSnip condition object
local mk_cond = require("luasnip.extras.conditions").make_condition

M = {}

M.line_begin = require("luasnip.extras.expand_conditions").line_begin

M.in_math = mk_cond(function()
    return vim.fn["vimtex#syntax#in_mathzone"]() == 1
end)

M.comment = mk_cond(function()
    return vim.fn["vimtex#syntax#in_comment"]() == 1
end)


-- This creates condition objects for a given environment name.
M.in_env = function(env_name)
    return mk_cond(function()
        -- VimTex returns the line and column of the '\begin{env}' if in it.
        -- If the cursor is outside of an environment it returns ("0", "0").
        local line, col = unpack(vim.fn["vimtex#env#is_inside"](env_name))
        return line ~= 0 and col ~= 0
    end)
end

-- example of LuaSnip's condition operators. In preamble means not in document
M.in_preamble = -M.in_env("document")

M.in_text = -M.in_math

return M
