-- Very simple math snippets

local tex = require("snippets.utils.tex")

Snips = {}

local word_trig = {
    [".E"] = [[\exists]],
    [".A"] = [[\ \forall ]],
    [".="] = [[\iff ]],
    [".>"] = [[\implies ]],
    [".<"] = [[\impliedby ]],
    [".f"] = [[\infty ]],
    [".v"] = [[\vec ]],
    [".b"] = [[\veb ]],
    [".c"] = [[\cdot ]],
    [".x"] = [[\times ]],
    [".ss"] = [[\subset ]],
    [":M"] = [[\mathbb ]],
    [":C"] = [[\mathcal ]],
    [";h"] = [[\hbar]],
    [",x"] = [[\hat ]],
}

local no_word_trig = {
    [".p"] = [[\partial]],
    [".V"] = [[\nabla]],
    [".S"] = [[\sum]],
    [".P"] = [[\prod]],
}

for trig, text in pairs(word_trig) do
    table.insert(Snips, s(
        { trig = trig, snippetType = "autosnippet", wordTrig = false },
        t(text),
        { condition = tex.in_math }
    ))
end

for trig, text in pairs(no_word_trig) do
    table.insert(Snips, s(
        { trig = trig, snippetType = "autosnippet" },
        t(text),
        { condition = tex.in_math }
    ))
end

return Snips
