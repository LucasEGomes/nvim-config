local catppuccin = require("catppuccin")
local ctp_feline = require("catppuccin.groups.integrations.feline")
local feline     = require("feline")
local gitsigns   = require("gitsigns")

gitsigns.setup()
local components = ctp_feline.get()
feline.setup({
    components = components,
})

catppuccin.setup({
    integrations = {
        cmp                = true,
        dap                = true,
        dap_ui             = true,
        native_lsp         = {
            enabled = true,
        },
        neotest            = true,
        treesitter         = true,
        treesitter_context = true,
    },
    flavour = "mocha",
    transparent_background = false,
    color_overrides = {
        all = {
            -- configure colors from
            -- :lua print(vim.inspect(require("catppuccin.palettes").get_palette("mocha")))
        }
    },
    --
    highlight_overrides = {
        all = function(colors)
            return {
                -- Comment = {fg = colors.flamingo},
                TreesitterContext = { bg = colors.surface0, },
                TreesitterContextLineNumber = { bg = colors.peach, },
                TreesitterContextBottom = { style = {} },
            }
        end
    },
})

vim.cmd.colorscheme("catppuccin")
