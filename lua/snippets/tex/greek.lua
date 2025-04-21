-- These start with a semicolon. e.g.: ";a" -> "\alpha"
-- Some are repeated so they use an extra semicolon

Snips = {}

local tex = require("snippets.utils.tex")

local alphabet = {
    ["a"] = "alpha",
    ["b"] = "beta",
    ["g"] = "gamma",
    ["G"] = "Gamma",
    ["d"] = "delta",
    ["D"] = "Delta",
    ["e"] = "varepsilon",
    ["z"] = "zeta",
    ["n"] = "eta",
    ["t"] = "theta",
    ["T"] = "Theta",
    ["k"] = "kappa",
    ["l"] = "lambda",
    ["L"] = "Lambda",
    ["m"] = "mu",
    ["v"] = "nu",
    ["x"] = "xi",
    ["X"] = "Xi",
    ["p"] = "pi",
    ["P"] = "Pi",
    ["r"] = "rho",
    ["s"] = "sigma",
    ["S"] = "Sigma",
    ["u"] = "upsilon",
    ["U"] = "Upsilon",
    ["f"] = "phi",
    ["F"] = "Phi",
    ["c"] = "chi",
    ["i"] = "psi",
    ["I"] = "Psi",
    ["o"] = "omega",
    ["O"] = "Omega",
}

local extra_alphabet = {
    [";e"] = "epsilon",
    [";i"] = "iota",
    [";r"] = "varrho",
    [";t"] = "tau",
    [";f"] = "varphi",
}

local function make_alph(maps)
    for trig, text in pairs(maps) do
        table.insert(Snips, s(
            {
                trig = ";" .. trig,
                snippetType = "autosnippet",
                wordTrig = false
            },
            {
                t("\\" .. text),
            },
            {
                condition = tex.in_math
            }
        ))
    end
end

-- If I put everything on the same table, triggers with that end the same may
-- get confused. I need to do those that start with an extra semicolon first
make_alph(extra_alphabet)
make_alph(alphabet)

return Snips
