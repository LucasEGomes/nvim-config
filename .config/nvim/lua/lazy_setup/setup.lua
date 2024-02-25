local path = "lazy_setup."
require("lazy").setup({
    require(path .. "catppuccin"),       -- Colorscheme
    require(path .. "cloak"),            -- Hide env values
    require(path .. "colorizer"),        -- Color highlight
    require(path .. "fugitive"),         -- Git plugin
    require(path .. "gitignore"),        -- Gitignore generator
    require(path .. "harpoon"),          -- Easy switch between files
    require(path .. "markdown_preview"), -- Preview markdown on web browser
    require(path .. "neodev"),           -- Automatic close braces
    require(path .. "neotest"),          -- Test framework
    require(path .. "nvim_autopairs"),   -- Automatic close braces
    require(path .. "nvim_cmp"),         -- LSP, Completion, and Snippets
    require(path .. "nvim_dap"),         -- Debug Adapter
    require(path .. "nvim_treesitter"),  --
    require(path .. "telescope"),        --
    require(path .. "trouble"),          -- Pretty list of diagnostics
    require(path .. "undotree"),         -- Undo history
})
