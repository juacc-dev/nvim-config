local utils = require("snippets.utils")
local tex = require("snippets.utils.tex")

return {
    -- Inline math
    s(
        { trig = "mm", snippetType = "autosnippet", },
        fmta("$<>$", { i(1) })
    ),

    -- Italics
    s(
        { trig = "it", dscr = "Italic" },
        fmta([[
        \textit{<>}
        ]], d(1, utils.get_selection)),
        { condition = tex.in_text }
    ),

    -- Bold
    s(
        { trig = "bf", dscr = "Bold" },
        fmta([[
        \textbf{<>}
        ]], d(1, utils.get_selection)),
        { condition = tex.in_text }
    ),

    s(
        { trig = "sec", dscr = "Section" },
        fmta([[
        \section{<>}
        ]], i(1)),
        { condition = tex.in_text }
    ),

    s(
        { trig = "sub", dscr = "Subsection" },
        fmta([[
        \subsection{<>}
        ]], i(1)),
        { condition = tex.in_text }
    ),

    s(
        { trig = "ssub", dscr = "Subsubsction" },
        fmta([[
        \subsubsection{<>}
        ]], i(1)),
        { condition = tex.in_text }
    ),

    -- Vertical space
    s(
        { trig = ">\\", snippetType = "autosnippet" },
        fmta([[
        \vspace{<>}
        ]], d(1, utils.get_selection)),
        { condition = tex.in_text + tex.line_begin }
    ),

    -- Input
    s(
        { trig = ">P", snippetType = "autosnippet" },
        fmta([[
            \input{<>}
            ]], i(1)),
        { condition = tex.in_text }
    ),

    -- Include
    s(
        { trig = ">I", snippetType = "autosnippet" },
        fmta([[
            \include{<>}
            ]], i(1)),
        { condition = tex.in_text }
    ),

    -- Use package
    s(
        { trig = ">K", snippetType = "autosnippet" },
        c(1, {
            fmta([[
            \usepackage{<>}
            ]], { r(1, "pkgname") }),

            fmta([[
            \usepackage[<>]{<>}
            ]], { i(2), r(1, "pkgname") }),
        }),
        { condition = tex.in_text }
    ),
}
