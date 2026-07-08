-- More complicated math snippets

local tex = require("snippets.utils.tex")
local utils = require("snippets.utils")


return {
    -- Integral
    s(
        { trig = ".I", snippetType = "autosnippet", },
        {
            t([[\int]]),
        },
        { condition = tex.in_math }
    ),

    -- Closed integral
    s(
        { trig = ".OI", snippetType = "autosnippet", },
        c(1, {
            t([[\oint]]),
            t([[\oiint]]),
        }),
        { condition = tex.in_math }
    ),

    -- Evaluated at...
    s(
        { trig = "/a", wordTrig = false, snippetType = "autosnippet" },
        c(1, {
            fmta([[\big|_{<>}]], { r(1, "at") }),
            fmta([[\Big|_{<>}]], { r(1, "at") }),
            fmta([[\bigg|_{<>}]], { r(1, "at") }),
            fmta([[\bigg|_{<>}]], { r(1, "at") }),
        }),
        { condition = tex.in_math }
    ),

    -- Horizontal braces
    s(
        { trig = "/ca", snippetType = "autosnippet" },
        c(1, {
            fmta([[
            \overbrace{<>}^{<>}
            ]], {
                d(1, utils.get_selection_restore, {}, { user_args = { "content" } }),
                r(2, "comment")
            }),

            fmta([[
            \overbrace{<>}^\text{<>}
            ]], {
                r(1, "content"),
                r(2, "comment")
            })
        }),
        { condition = tex.in_math }
    ),

    s(
        { trig = "/cs", snippetType = "autosnippet" },
        c(1, {
            fmta([[
            \underbrace{<>}_{<>}
            ]], {
                d(1, utils.get_selection_restore, {}, { user_args = { "content" } }),
                r(2, "comment")
            }),

            fmta([[
            \underbrace{<>}_\text{<>}
            ]], {
                r(1, "content"),
                r(2, "comment")
            })
        }),
        { condition = tex.in_math }
    ),

    -- Fraction
    s(
        { trig = "//", snippetType = "autosnippet", },
        c(1, {
            fmta([[\frac{<>}{<>}]], {
                d(1, utils.get_selection_restore, {}, { user_args = { "keep" } }),
                i(2)
            }),
            fmta([[\frac{<>}{<>}]], { -- invert fraction
                i(1),
                r(2, "keep")
            }),
        }),
        { condition = tex.in_math }
    ),

    -- Subscript
    s(
        { trig = "__", wordTrig = false, snippetType = "autosnippet", },
        c(1, {
            fmta("_{<>}", { r(1, "r") }),
            fmta([[_\text{<>}]], { r(1, "r") }),
        }),
        { condition = tex.in_math }
    ),

    -- Superscript
    s(
        { trig = "^^", wordTrig = false, snippetType = "autosnippet", },
        c(1, {
            fmta("^{<>}", { r(1, "r") }),
            fmta([[^\text{<>}]], { r(1, "r") }),
        }),
        { condition = tex.in_math }
    ),

    -- Top and bottom
    s(
        { trig = "/b", wordTrig = false, snippetType = "autosnippet" },
        {
            c(1, {
                fmta([[_{<>}^{<>}]], { r(1, "bot"), i(2) }),
                fmta([[_{<>}]], { r(1, "bot") }),
            })
        },
        { condition = tex.in_math }
    ),

    -- Square root
    s(
        { trig = "/q", snippetType = "autosnippet" },
        fmta([[\sqrt{<>}]], d(1, utils.get_selection)),
        { condition = tex.in_math }
    ),

    -- Vector norm
    s(
        { trig = "/m", snippetType = "autosnippet" },
        fmta([[\norm{<>}]], d(1, utils.get_selection)),
        { condition = tex.in_math }
    ),

    -- Derivative
    s(
        { trig = "/d", snippetType = "autosnippet", },
        c(1, {
            fmta([[\dv{<>}{<>}]], {
                d(1, utils.get_selection_restore, {}, { user_args = { "f" } }),
                r(2, "var", i(nil, "x"))
            }),
            fmta([[\dv{<>} <>]], {
                r(1, "var"),
                r(2, "f")
            }),
        }),
        { condition = tex.in_math }
    ),

    -- Nth derivative
    s(
        { trig = "/nd", snippetType = "autosnippet", },
        c(1, {
            fmta([[\dv[<>]{<>}{<>}]], {
                r(1, "order", i(nil, "2")),
                d(2, utils.get_selection_restore, nil, { user_args = { "f" } }),
                r(3, "var", i(nil, "x"))
            }),
            fmta([[\dv[<>]{<>} <>]], {
                r(1, "order"),
                r(2, "var"),
                r(3, "f")
            }),
        }),
        { condition = tex.in_math }
    ),

    -- Partial derivative
    s(
        { trig = "/sd", snippetType = "autosnippet", },
        c(1, {
            fmta([[\pdv{<>}{<>}]], {
                d(1, utils.get_selection_restore, {}, { user_args = { "f" } }),
                r(2, "var", i(nil, "x"))
            }),
            fmta([[\pdv{<>} <>]], {
                r(1, "var"),
                r(2, "f")
            }),
        }),
        { condition = tex.in_math }
    ),

    -- Nth partial derivative
    s(
        { trig = "/nsd", snippetType = "autosnippet", },
        c(1, {
            fmta([[\pdv[<>]{<>}{<>}]], {
                r(1, "order", i(nil, "2")),
                d(2, utils.get_selection_restore, nil, { user_args = { "f" } }),
                r(3, "var", i(nil, "x"))
            }),
            fmta([[\pdv[<>]{<>} <>]], {
                r(1, "order"),
                r(2, "var"),
                r(3, "f")
            }),
        }),
        { condition = tex.in_math }
    ),

    -- Limit
    s(
        { trig = "/l", snippetType = "autosnippet" },
        fmta([[\lim_{<>\to <>} ]], { i(1), i(2, "\\infty") }),
        { condition = tex.in_math }
    ),

    s(
        { trig = "v,b", wordTrig = false, snippetType = "autosnippet" },
        fmta([[\braket{<>}{<>}]], { i(1), i(2) }),
        { condition = tex.in_math }
    ),

    s(
        { trig = "b,v", wordTrig = false, snippetType = "autosnippet" },
        fmta([[\ketbra{<>}{<>}]], { i(1), i(2) }),
        { condition = tex.in_math }
    ),

    s(
        { trig = ",v", wordTrig = false, snippetType = "autosnippet" },
        fmta([[\bra{<>}]], { i(1) }),
        { condition = tex.in_math }
    ),

    s(
        { trig = ",b", wordTrig = false, snippetType = "autosnippet" },
        fmta([[\ket{<>}]], { i(1) }),
        { condition = tex.in_math }
    ),
}
