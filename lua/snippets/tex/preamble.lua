local utils = require("snippets.utils")
local tex = require("snippets.utils.tex")

-- This shuold be a custom snippet at the root of each project or smth
return {
    s(
        { trig = "template", dscr = "Template article", },
        fmta(
            [[
            \documentclass[<>]{<>}

            \title{<>}
            \author{<>}
            \date{<>}

            \input{etc/def/packages.tex}
            \input{etc/def/commands.tex}
            \input{etc/overrides.tex}

            \begin{document}

            \maketitle
            \tableofcontents

            <>

            \end{document}
            ]],
            {
                i(2, "a5paper"),
                i(1, "article"),
                i(3),
                i(4),
                i(5),
                i(0),
            }
        ),
        { condition = tex.in_preamble }
    )
}
