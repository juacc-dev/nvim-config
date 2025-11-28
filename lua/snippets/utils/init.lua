local ls = require("luasnip")
local s = ls.snippet
local sn = ls.snippet_node
local t = ls.text_node
local i = ls.insert_node
local f = ls.function_node
local c = ls.choice_node
local d = ls.dynamic_node
local r = ls.restore_node
local fmt = require("luasnip.extras.fmt").fmt
local fmta = require("luasnip.extras.fmt").fmta

M = {}

-- from pressing `store_selection_keys` on selected text
function M.get_selection(_, parent)
    local selected = parent.snippet.env.LS_SELECT_RAW
    if #selected > 0 then
        return sn(nil, i(1, selected))
    else
        return sn(nil, i(1))
    end
end

-- same as before but retaining input
function M.get_selection_restore(_, parent, _)
    local selected = parent.snippet.env.LS_SELECT_RAW
    local restore_key = "selection_restore"
    if #selected > 0 then
        return sn(1, r(1, restore_key, i(nil, selected)))
    else
        return sn(1, r(1, restore_key))
    end
end

-- M.line_begin = require("luasnip.extras.expand_conditions").line_begin

return M
