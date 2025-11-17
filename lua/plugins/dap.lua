-- This file loads:
--
-- nvim-dap
-- nvim-dap-ui
-- nvim-dap-python

return {
    {
        "mfussenegger/nvim-dap",
        -- dependencies = {
        --     "rcarriga/nvim-dap-ui",
        -- },

        lazy = true,

        config = function()
            local dap = require("dap")
            local ui = require("dapui")

            -- Check `:help dap.txt` for descriptions and more functions
            vim.keymap.set("n", "<leader>dc", dap.continue)
            vim.keymap.set("n", "<leader>ds", dap.step_over)
            vim.keymap.set("n", "<leader>di", dap.step_into)
            vim.keymap.set("n", "<leader>do", dap.step_out)
            vim.keymap.set("n", "<leader>db", dap.toggle_breakpoint)
            vim.keymap.set("n", "<leader>dl", dap.run_to_cursor)
            vim.keymap.set("n", "<leader>dB", dap.clear_breakpoints)
            vim.keymap.set("n", "<leader>dx", dap.restart)
            vim.keymap.set("n", "<leader>dX", dap.terminate)
            vim.keymap.set("n", "<leader>dK", require("dap.ui.widgets").hover)

            vim.keymap.set("n", "<leader>dt", ui.toggle)

            -- Automatically open or close ui based on nvim-dap events
            dap.listeners.before.attach.dapui_config = function()
                ui.open()
            end

            dap.listeners.before.launch.dapui_config = function()
                ui.open()
            end

            dap.listeners.before.event_terminated.dapui_config = function()
                ui.close()
            end

            dap.listeners.before.event_exited.dapui_config = function()
                ui.close()
            end
        end
    },

    {
        "rcarriga/nvim-dap-ui",

        lazy = true,

        dependencies = {
            "mfussenegger/nvim-dap",
            "nvim-neotest/nvim-nio" -- asynchronious IO
        },

        opts = {
            -- This is MOSTLY the default configuration
            -- Check `:help dapui.setup()`
            mappings = {
                edit   = "e",
                expand = { "<CR>", "<2-LeftMouse>" },
                open   = "o",
                remove = "d",
                repl   = "r",
                toggle = "t"
            },
            controls = {
                element = "repl",
                enabled = true,
                -- I dislike icons
                icons = {
                    pause      = "[pause]",
                    play       = "[play]",
                    run_last   = "[runlast]",
                    step_back  = "[back]",
                    step_into  = "[into]",
                    step_out   = "[out]",
                    step_over  = "[over]",
                    terminate  = "[exit]",
                    disconnect = "[discon]",
                }
            },
            element_mappings = {},
            expand_lines = true,
            floating = {
                border = "single",
                mappings = {
                    close = { "q", "<Esc>" }
                }
            },
            force_buffers = true,
            icons = {
                collapsed     = ">",
                current_frame = ">",
                expanded      = "v"
            },
            layouts = {
                {
                    elements = {
                        { id = "watches",     size = 0.3 },
                        { id = "scopes",      size = 0.4 },
                        { id = "stacks",      size = 0.2 },
                        { id = "breakpoints", size = 0.1 },
                    },
                    position = "left",
                    size = 48,
                },
                {
                    elements = {
                        { id = "console", size = 0.5 },
                        { id = "repl",    size = 0.5 },
                    },
                    position = "bottom",
                    size = 15,
                }
            },
            render = {
                indent = 2,
                max_value_lines = 100
            }
        }
    },

    {
        -- Python
        {
            "mfussenegger/nvim-dap-python",

            ft = "python",

            dependencies = {
                "mfussenegger/nvim-dap",
                "rcarriga/nvim-dap-ui",
            },

            config = function()
                local path = "~/.local/share/nvim/mason/packages/debugpy/venv/bin/python"
                require("dap-python").setup(path)
                table.insert(require('dap').configurations.python, {
                    justMyCode = false,
                })
            end
        }
    }
}
