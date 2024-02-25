return {
    "nvim-neotest/neotest",
    dependencies = {
        "nvim-lua/plenary.nvim",
        "antoinemadec/FixCursorHold.nvim",
        "nvim-treesitter/nvim-treesitter",
        -- Runners
        "nvim-neotest/neotest-python", -- Python
        "nvim-neotest/neotest-go",     -- Go
        {
            "mrcjkb/rustaceanvim",     -- Rust
            version = "^4",
            ft = { "rust" },
        },
        "lawrence-laz/neotest-zig",      -- Zig
        "alfaix/neotest-gtest",          -- C++
        "marilari88/neotest-vitest",     -- JS, TS
        "nvim-neotest/neotest-vim-test", -- For runners without adapter, uses vim-test
        "vim-test/vim-test",
    },
}
