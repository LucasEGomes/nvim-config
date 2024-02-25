return {
    "nvim-treesitter/nvim-treesitter",
    dependencies = {
        "nvim-treesitter/nvim-treesitter-context",
    },
    config = function()
        vim.cmd('silent exec "!TSUpdate"')
    end,
}
