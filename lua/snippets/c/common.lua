return {
    s(
        { trig = "int main" },
        fmta([[
        int main(int argc, char* argv[]) {
            <>

            return 0;
        }
        ]], { i(0) })
    ),

    -- if() with and without braces
    s(
        { trig = "if" },
        c(1, {
            fmta([[
            if(<>) {
                <>
            }

            ]], { r(1, "cond"), r(2, "code") }),
            fmta([[
            if(<>)
                <>

            ]], { r(1, "cond"), r(2, "code") }),
        })
    ),
    s(
        { trig = "func" },
        fmta([[
            <> <>(<>) {
                <>
            }
        ]], { i(1, "int"), i(2, "f"), i(3, "void"), i(4) })
    ),
    s(
        { trig = "funcdecl" },
        fmta([[
            <> <>(<>);
        ]], { i(1, "int"), i(2, "f"), i(3, "void") })
    ),
    s(
        { trig = "ifndef" },
        fmt([[
        #ifndef {}
        #define {}

        {}

        #endif /* {} */
        ]], { i(1), rep(1), i(0), rep(1) })
    ),
}
