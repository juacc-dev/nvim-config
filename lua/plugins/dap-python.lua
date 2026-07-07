-- This requires the python module 'debugpy' to be installed in the current
-- environment.

require("plugins.dap")

require("dap-python").setup("python3")

table.insert(require('dap').configurations.python, {
    name = 'Jump into libraries',
    justMyCode = false,
    type = 'python',
    request = 'launch',
    program = '${file}',
    args = get_args,
    -- ... more options, see https://github.com/microsoft/debugpy/wiki/Debug-configuration-settings
})
