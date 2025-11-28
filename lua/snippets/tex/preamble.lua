local utils = require("snippets.utils")
local tex = require("snippets.utils.tex")

-- This shuold be a custom snippet at the root of each project or smth
return {
    s(
        { trig = "template", dscr = "Quick template", },
        fmta(
            [[
            \documentclass[a4paper]{article}

            % Math
            \usepackage{amsmath}
            \usepackage{amsfonts}
            \usepackage{amssymb}
            \usepackage{cancel}
            \usepackage{esint} % Closed integrals
            \usepackage{amsthm} % Theorem-like environments
            \usepackage{physics}
            \usepackage{siunitx}

            % Silence siunitx warning that shows up when also loading the physics package
            \AtBeginDocument{\RenewCommandCopy\qty\SI}
            \ExplSyntaxOn
            \msg_redirect_name:nnn { siunitx } { physics-pkg } { none }
            \ExplSyntaxOff

            \let\lowdot\d
            \renewcommand{\d} {\operatorname{d}}
            % real and imaginary part
            \let\oldreal\real
            \renewcommand{\real} {\operatorname{Re}}
            \newcommand{\imag} {\operatorname{Im}}
            % complex conjugate
            \newcommand{\conj} {\ensuremath{^\ast}}
            % Tal que
            \newcommand{\tq} {\mathrel{\mathrm{t.q.}}}

            \begin{document}

            <>

            \end{document}
            ]],
            { i(0) }
        ),
        { condition = tex.in_preamble }
    )
}
