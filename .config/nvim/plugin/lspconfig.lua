local lspconfig    = require("lspconfig")
local mason        = require("mason")
local mason_lsp    = require("mason-lspconfig")
local neodev       = require("neodev")

neodev.setup({
    library = { plugins = { "nvim-dap-ui", "neotest" }, types = true }
})
local ensure_installed = {
    "autotools_ls",                    -- Makefile
    "bashls",                          -- Bash
    "clangd",                          -- C, C++
    "cmake",                           -- Cmake
    "cssls",                           -- CSS, SCSS & LESS
    "docker_compose_language_service", -- Docker compose
    "dockerls",                        -- Dockerfile
    "eslint",                          -- Eslint
    "gopls",                           -- Golang
    "ltex",                            -- Latex, Markdown, Text
    "lua_ls",                          -- Lua. It helps to configure this tool
    "marksman",                        -- Markdown
    "jsonls",                          -- json
    "jsonls",                          -- json
    "pylsp",                           -- Python
    "rust_analyzer",                   -- Rust
    "sqlls",                           -- SQL
    "taplo",                           -- toml
    "terraformls",                     -- Terraform
    "tsserver",                        -- Javascript, Typescript
    "vimls",                           -- Vimscript
    "yamlls",                          -- yaml
    "zls",                             -- Zig
}


local handlers = {
    function(server_name)
        if server_name == "rust_analyzer" then
            return
        end
        lspconfig[server_name].setup({})
    end,
    ["lua_ls"] = function()
        lspconfig.lua_ls.setup {
            settings = {
                Lua = {
                    diagnostics = {
                        globals = { "vim" }
                    }
                }
            }
        }
    end,
}

mason.setup()
mason_lsp.setup({
    handlers = handlers,
    ensure_installed = ensure_installed,
})
