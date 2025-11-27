-- Common math stuff

local tex = require("snippets.utils.tex")
local utils = require("snippets.utils")


return {
    -- ##################### --
    -- ## Static snippets ## --
    -- ##################### --

    -- Exists
    s(
        { trig = ".E", wordTrig = false, snippetType = "autosnippet", },
        t([[\exists]]),
        { condition = tex.in_math }
    ),

    -- Forall
    s(
        { trig = ".A", wordTrig = false, snippetType = "autosnippet", },
        t([[\ \forall ]]),
        { condition = tex.in_math }
    ),

    -- <=>
    s(
        { trig = ".=", wordTrig = false, snippetType = "autosnippet", },
        t([[\iff]]),
        { condition = tex.in_math }
    ),

    -- =>
    s(
        { trig = ".>", wordTrig = false, snippetType = "autosnippet", },
        t([[\implies]]),
        { condition = tex.in_math }
    ),

    -- <=
    s(
        { trig = ".<", wordTrig = false, snippetType = "autosnippet", },
        t([[\impliedby]]),
        { condition = tex.in_math }
    ),

    -- Infinity
    s(
        { trig = ".f", wordTrig = false, snippetType = "autosnippet", },
        t([[\infty]]),
        { condition = tex.in_math }
    ),

    -- Vector arrow
    s(
        { trig = ".v", wordTrig = false, snippetType = "autosnippet", },
        t([[\vec ]]),
        { condition = tex.in_math }
    ),

    -- Bold vector
    s(
        { trig = ".b", snippetType = "autosnippet", },
        t([[\veb ]]),
        { condition = tex.in_math }
    ),

    -- Dot product
    s(
        { trig = ".c", wordTrig = false, snippetType = "autosnippet" },
        t([[\cdot]]),
        { condition = tex.in_math }
    ),

    -- Cross / cartesian product
    s(
        { trig = ".x", wordTrig = false, snippetType = "autosnippet" },
        t([[\times]]),
        { condition = tex.in_math }
    ),

    -- Complex conjugate
    -- s(
    --     { trig = ".-", snippetType = "autosnippet", },
    --     t([[\conj]]),
    --     { condition = tex.in_math }
    -- ),

    -- Subset
    s(
        { trig = ".ss", wordTrig = false, snippetType = "autosnippet" },
        t([[\subset]]),
        { condition = tex.in_math }
    ),

    -- Dot derivative
    s(
        { trig = ".d", snippetType = "autosnippet", },
        t([[\dot]]),
        { condition = tex.in_math }
    ),

    -- Partial derivative symbol
    s(
        { trig = ".p", snippetType = "autosnippet", },
        t([[\partial]]),
        { condition = tex.in_math }
    ),

    -- Nabla
    s(
        { trig = ".V", snippetType = "autosnippet", },
        { t([[\nabla]]) },
        { condition = tex.in_math }
    ),

    s(
        { trig = ".I", snippetType = "autosnippet", },
        {
            c(1, {
                t([[\int]]),
                t([[\iint]]),
                t([[\iiint]]),
            })
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

    -- Summation (sigma)
    s(
        { trig = ".S", snippetType = "autosnippet" },
        t([[\sum]]),
        { condition = tex.in_math }
    ),

    -- Product (pi)
    s(
        { trig = ".P", snippetType = "autosnippet" },
        t([[\prod]]),
        { condition = tex.in_math }
    ),

    -- Cool math typesetting
    s(
        { trig = ".M", wordTrig = false, snippetType = "autosnippet" },
        t([[\mathbb ]]),
        { condition = tex.in_math }
    ),

    s(
        { trig = ";h", wordTrig = false, snippetType = "autosnippet" },
        t([[\hbar]]),
        { condition = tex.in_math }
    ),

    s(
        { trig = ",x", wordTrig = false, snippetType = "autosnippet" },
        t([[\hat ]]),
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

    -- ########################## --
    -- ## Completable snippets ## --
    -- ########################## --

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
            ]], { r(1, "content"), r(2, "comment") }),

            fmta([[
            \overbrace{<>}^\text{<>}
            ]], { r(1, "content"), r(2, "comment") })
        }),
        { condition = tex.in_math }
    ),

    s(
        { trig = "/cs", snippetType = "autosnippet" },
        c(1, {
            fmta([[
            \underbrace{<>}_{<>}
            ]], { r(1, "content"), r(2, "comment") }),

            fmta([[
            \underbrace{<>}_\text{<>}
            ]], { r(1, "content"), r(2, "comment") })
        }),
        { condition = tex.in_math }
    ),

    -- Fraction
    s(
        { trig = "//", snippetType = "autosnippet", },
        fmta([[\frac{<>}{<>}]], { i(1), i(2) }),
        { condition = tex.in_math }
    ),

    -- Subscript
    s(
        { trig = "__", wordTrig = false, snippetType = "autosnippet", },
        c(1, {
            fmta("_{<>}", { r(1, "r") }),
            fmta("_\\text{<>}", { r(1, "r") }),
        }),
        { condition = tex.in_math }
    ),

    -- Superscript
    s(
        { trig = "^^", wordTrig = false, snippetType = "autosnippet", },
        c(1, {
            fmta("^{<>}", { r(1, "r") }),
            fmta("^\\text{<>}", { r(1, "r") }),
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
        fmta([[\sqrt{<>}]], i(1)),
        { condition = tex.in_math }
    ),

    -- Vector norm
    s(
        { trig = "/m", snippetType = "autosnippet" },
        fmta([[\norm{<>}]], i(1, "\\cdot")),
        { condition = tex.in_math }
    ),

    -- Derivative
    s(
        { trig = "/d", snippetType = "autosnippet", },
        c(1, {
            fmta([[\dv{<>}{<>}]], { i(1), r(2, "var", i(nil, "x")) }),
            fmta([[\dv{<>} ]], { r(1, "var", i(nil, "x")) }),
        }),
        { condition = tex.in_math }
    ),

    -- Nth derivative
    s(
        { trig = "/nd", snippetType = "autosnippet", },
        c(1, {
            fmta([[\dv[<>]{<>}{<>}]], { r(1, "order", i(nil, "2")), i(2), r(3, "var", i(nil, "x")) }),
            fmta([[\dv[<>]{<>} ]], { r(1, "order", i(nil, "2")), r(2, "var", i(nil, "x")) }),
        }),
        { condition = tex.in_math }
    ),

    -- Partial derivative
    s(
        { trig = "/sd", snippetType = "autosnippet", },
        c(1, {
            fmta([[\pdv{<>}{<>}]], { i(1), r(2, "var", i(nil, "x")) }),
            fmta([[\pdv{<>} ]], { r(1, "var", i(nil, "x")) }),
        }),
        { condition = tex.in_math }
    ),

    -- Nth partial derivative
    s(
        { trig = "/nsd", snippetType = "autosnippet", },
        c(1, {
            fmta([[\pdv[<>]{<>}{<>}]], { r(1, "order", i(nil, "2")), i(2), r(3, "var", i(nil, "x")) }),
            fmta([[\pdv[<>]{<>} ]], { r(1, "order", i(nil, "2")), r(2, "var", i(nil, "x")) }),
        }),
        { condition = tex.in_math }
    ),

    -- Function definition
    s(
        { trig = "/f", },
        c(1, {
            fmta([[<>:<>\to <>]], { i(1, "f"), i(2, "\\reals"), i(3, "\\reals") }),
            fmta([[<>:[a; b]\to <>]], { i(1, "f"), i(2, "\\reals") }),
        }),
        { condition = tex.in_math }
    ),

    -- Limit
    s(
        { trig = "/l", snippetType = "autosnippet" },
        fmta([[\lim_{<>\to <>} ]], { i(1), i(2, "\\infty") }),
        { condition = tex.in_math }
    ),
}
