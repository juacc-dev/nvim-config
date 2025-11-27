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


local make_bracket_snip = function(left, right, snip)
    return fmta(string.format([[
    \%s<> <> \%s<>
    ]], left, right), {
        f(function(_, _)
            local cap = snip.captures[1] or "p"
            return brackets[cap][1]
        end),
        d(1, utils.get_selection),
        f(function(_, _)
            local cap = snip.captures[1] or "p"
            return brackets[cap][2]
        end)
    })
end

return {
    -- Parentheses and stuff.
    -- e.g.: "lrp" -> "\left( ... \right)"
    s(
        { trig = "lr([pqnacm])", regTrig = true, snippetType = "autosnippet" },
        d(1, function(_, snip)
            return sn(nil, {
                c(1, {
                    make_bracket_snip("left", "right", snip),
                    make_bracket_snip("bigl", "bigr", snip),
                    make_bracket_snip("Bigl", "Bigr", snip),
                    make_bracket_snip("biggl", "biggr", snip),
                    make_bracket_snip("Biggl", "Biggr", snip),
                })
            })
        end),
        { condition = tex.in_math }
    ),
}
