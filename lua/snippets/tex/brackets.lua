local tex = require("snippets.utils.tex")
local utils = require("snippets.utils")

local brackets = {
    ["p"] = { "(", ")" },
    ["q"] = { "[", "]" },
    ["n"] = { "\\|", "\\|" },           -- vector norm ||.||
    ["a"] = { "\\langle", "\\rangle" }, -- <.>
    ["c"] = { "\\{", "\\}" },           -- {.} (cases)
    ["m"] = { "|", "|" },               -- absolute value
}

-- string containg all keys
local trig_str = ""
for bracket, _ in pairs(brackets) do
    trig_str = trig_str .. bracket
end


local function my_func(args, _)
    return sn(nil, {r(1, "the_text", i(nil, "hello there"))})
end

-- this works but does not retain written text
local bracket_snip = function(left, right, snip, restore)
    return fmta(string.format([[
    \%s<> <> \%s<>
    ]], left, right), {
        f(function(_, _)
            local cap = snip.captures[1] or "p"
            return brackets[cap][1]
        end),
        d(1, utils.get_selection_restore),
        f(function(_, _)
            local cap = snip.captures[1] or "p"
            return brackets[cap][2]
        end)
    })
end

return {
    -- Brackets and parentheses.
    -- e.g.: "lrp" -> "\left( ... \right)"
    s(
        {
            trig = string.format("lr([%s])", trig_str),
            regTrig = true,
            snippetType = "autosnippet"
        },
        d(1, function(_, snip)
            return sn(nil, {
                c(1, {
                    bracket_snip("left", "right", snip),
                    bracket_snip("bigl", "bigr", snip),
                    bracket_snip("Bigl", "Bigr", snip),
                    bracket_snip("biggl", "biggr", snip),
                    bracket_snip("Biggl", "Biggr", snip),
                })
            })
        end),
        {
            condition = tex.in_math,
        }
    ),
    s("paren_change", {
        c(1, {
            sn(nil, d(1, my_func)),
            sn(nil, { t("("), r(1, "user_text"), t(")") }),
            sn(nil, { t("["), r(1, "user_text"), t("]") }),
            sn(nil, { t("{"), r(1, "user_text"), t("}") }),
        }),
    } )
}
