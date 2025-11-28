-- Environents are those in \begin{env} ... \end{env} These snippets start with an equals sign. e.g.: "=e" -> "equation"

Snips = {}

local tex = require("snippets.utils.tex")


local DEFAULT_CONDITION = (tex.in_text * tex.line_begin)

local envs = {
    -- ["="] = {}, -- "==", empty env
    ["e"] = { env = "equation"  },
    ["d"] = { env = "displaymath" },
    ["g"] = { env = "gather*" },
    ["a"] = { env = "align*" },

    ["i"] = { env = "itemize" },
    ["n"] = { env = "enumerate" },

    ["tt"] = { env = "Teo",  named = true },
    ["tl"] = { env = "Lema", named = true },
    ["td"] = { env = "Def",  named = true },
    ["tc"] = { env = "Coro", named = true },
    ["tp"] = { env = "Prop", named = true },
    ["to"] = { env = "Obs",  named = true },

    ["m"] = { env = "bmatrix", condition = tex.in_math },
    ["c"] = { env = "cases", condition = tex.in_math },
}

-- create latex environments
local function create_env(env, named)
    -- Empty environment
    if named == nil then
        return fmta(string.format([[
            \begin{%s}
                <>
            \end{%s}
            ]], env, env), { i(1) })

    else
        return c(1, {
            fmta(string.format([[
            \begin{%s}
                <>
            \end{%s}
            ]], env, env), { r(1, "body") }),

            fmta(string.format([[
            \begin{%s}[<>]
                <>
            \end{%s}
            ]], env, env), { i(1), r(2, "body") }),
        })
    end
end

for trig, opts in pairs(envs) do
    table.insert(
        Snips,
        s(
            { trig = "=" .. trig, snippetType = "autosnippet", },
            create_env(opts.env, opts.named),
            { condition = opts.condition or DEFAULT_CONDITION }
        )
    )
end

table.insert(Snips,
    s(
        { trig = "==", snippetType = "autosnippet", },
        c(1, {
            fmta(
                [[
                \begin{<>}
                    <>
                \end{<>}
                ]], { i(1), i(2), rep(1) }),
            fmta(
                [[
                \begin{<>}[<>]
                    <>
                \end{<>}
                ]], { i(1), i(2), i(3), rep(1) }),
        }),
        { condition = tex.line_begin }
    )
)

-- This snippet is a little bit different, so I do it separately
table.insert(Snips,
    s(
        { trig = "=n", snippetType = "autosnippet", },
        fmta(
            [[
            \begin{enumerate}<>
                \item <>
            \end{enumerate}
            ]],
            {
                c(1, {
                    t(""),
                    fmta([[
                [label=(\<>*)]
                ]], c(1, {
                            t("roman"), t("Roman"), t("alph"), t("Alph"), i(1)
                        })),
                }),
                i(2)
            }),
        { condition = tex.line_begin }
    )
)

return Snips
