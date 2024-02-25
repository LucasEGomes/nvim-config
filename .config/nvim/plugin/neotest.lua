local neotest          = require("neotest")
local neotest_go       = require("neotest-go")
local neotest_python   = require("neotest-python")
local neotest_rust     = require("rustaceanvim")
local neotest_vim_test = require("neotest-vim-test")

local adapter_python   = neotest_python({
    dap = {
        justMyCode = true,
    },
    args = {
        "--log-level", "DEBUG",
    },
    runner = "pytest",
})

local adapter_go       = neotest_go({})

local adapter_rust     = neotest_rust

local adapter_vim_test = neotest_vim_test({
    ignore_filetypes = {
        "c++",
        "go",
        "rust",
        "javascript",
        "python",
        "typescript",
        "zig",
    },
})
neotest.setup({
    adapters = {
        adapter_python,
        --        adapter_go,
        --        adapter_rust,
        adapter_vim_test,
    },
    summary = {
        open = "topleft vsplit | vertical resize " .. math.floor(vim.opt.columns._value * 0.2),
    },
})
