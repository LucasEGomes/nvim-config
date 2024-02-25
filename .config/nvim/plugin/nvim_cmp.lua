local cmp = require("cmp")
local luasnip = require("luasnip")
local neogen = require("neogen")

require("luasnip.loaders.from_vscode").lazy_load() -- friendly-snippets dependency

neogen.setup({
    enabled = true,
    snippet_engine = "luasnip",
    languages = {
        python = {
            template = {
                annotation_convention = "numpydoc",
            },
        },
    },
})

local function has_words_before()
    unpack = unpack or table.unpack
    local line, col = unpack(vim.api.nvim_win_get_cursor(0))
    return col ~= 0 and vim.api.nvim_buf_get_lines(0, line - 1, line, true)[1]:sub(col, col):match("%s") == nil
end

local mapping = {
    ["<C-b>"] = cmp.mapping.scroll_docs(-4),
    ["<C-f>"] = cmp.mapping.scroll_docs(4),
    ["<C-Space>"] = cmp.mapping.complete(),
    ["<C-e>"] = cmp.mapping.abort(),
    ["<CR>"] = cmp.mapping.confirm({ select = true }),
    ["<C-y>"] = cmp.mapping.confirm({ select = true }),
    ["<Tab>"] = cmp.mapping(function(fallback)
        if cmp.visible() then
            cmp.select_next_item()
            -- You could replace the expand_or_jumpable() calls with expand_or_locally_jumpable()
            -- that way you will only jump inside the snippet region
        elseif luasnip.expand_or_jumpable() then
            luasnip.expand_or_jump()
        elseif has_words_before() then
            cmp.complete()
        else
            fallback()
        end
    end, { "i", "s" }),
    ["<S-Tab>"] = cmp.mapping(function(fallback)
        if cmp.visible() then
            cmp.select_prev_item()
        elseif luasnip.jumpable(-1) then
            luasnip.jump(-1)
        else
            fallback()
        end
    end, { "i", "s" }),
}

cmp.setup({
    snippet = {
        expand = function(args)
            -- vim.fn["vsnip#anonymous"](args.body)
            luasnip.lsp_expand(args.body)
        end
    },
    window = {
    },
    mapping = cmp.mapping.preset.insert(mapping),
    sources = cmp.config.sources({
            { name = "luasnip" },
            { name = "nvim_lsp" },
        },
        {
            { name = "buffer" },
        }),
})

cmp.setup.cmdline({ "/", "?" }, {
    mapping = cmp.mapping.preset.cmdline(),
    sources = {
        { name = "buffer" },
    },
})

cmp.setup.cmdline({ ":" }, {
    mapping = cmp.mapping.preset.cmdline(),
    sources = cmp.config.sources({
            { name = "path" },
        },
        {
            { name = "cmdline" },
        }),
})

local cmp_autopairs = require("nvim-autopairs.completion.cmp")
cmp.event:on(
    "confirm_done",
    cmp_autopairs.on_confirm_done()
)
