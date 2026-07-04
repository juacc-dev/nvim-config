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

            % Roman numerals in upper case
            \newcommand{\rom}[1] {\MakeUppercase{\romannumeral #1}}
            \let\oldreal\real
            \renewcommand{\real} {\operatorname{Re}}
            \newcommand{\imag} {\operatorname{Im}}
            \newcommand{\conj} {\ensuremath{^\ast}}
            \newcommand{\tq} {\mathrel{\mathrm{t.q.}}}
            \newcommand{\veb}[1] {\boldsymbol{#1}}
            \newcommand{\uvec}[1] {\ensuremath{\boldsymbol{\hat{#1}}}}
            \newcommand{\ontop}[2]{\stackrel{\mathclap{\normalfont\mbox{#2}}}{#1}}
            \newcommand{\sub}[1] {\scriptscriptstyle {#1}}

            % Underbrace but with restrained width
            \newcommand{\unbrace}[2] {
                \ensuremath{
                    \underbrace{#1}_{
                        \parbox{\widthof{$#1$}}{\scriptsize\centering {#2}}
                    }
                }
            }

            \begin{document}

            <>

            \end{document}
            ]],
            { i(0) }
        ),
        { condition = tex.in_preamble }
    )
}
