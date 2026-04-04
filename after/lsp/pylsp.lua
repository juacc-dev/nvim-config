return {
    settings = {
        pylsp = {
            plugins = {
                -- More info on
                -- https://pycodestyle.pycqa.org/en/latest/intro.html
                pycodestyle = {
                    enabled = true,
                    ignore = { 'E2', 'E3', 'E731' },
                    maxLineLength = 80
                }
            }
        }
    }
}
