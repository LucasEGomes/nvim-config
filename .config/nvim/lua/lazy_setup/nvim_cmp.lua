return {
    "hrsh7th/nvim-cmp",
    dependencies = {
        -- LSP support
        "neovim/nvim-lspconfig",
        "williamboman/mason.nvim",
        "williamboman/mason-lspconfig.nvim",

        -- Completion
        "hrsh7th/cmp-buffer",
        "hrsh7th/cmp-cmdline",
        "hrsh7th/cmp-nvim-lsp",
        "hrsh7th/cmp-nvim-lua",
        "hrsh7th/cmp-path",
        "hrsh7th/nvim-cmp",
        -- "hrsh7th/cmp-vsnip",
        "saadparwaiz1/cmp_luasnip",
        {
            "danymat/neogen",
            dependencies = {
                "nvim-treesitter/nvim-treesitter",
            },
            config = true,
        },
        {
            "ray-x/lsp_signature.nvim",
            event = "VeryLazy",
            opts = {},
            config = function(_, opts) require("lsp_signature").setup(opts) end,
        },

        -- Snippets
        "L3MON4D3/LuaSnip",
        "rafamadriz/friendly-snippets"
        -- "hrsh7th/vim-vsnip",
    }
}
