vim.g.mapleader        = " "
vim.opt.listchars      = { space = '·', tab = '→ ', eol = '$' }
vim.opt.list           = true

vim.opt.guicursor      = ""

vim.opt.nu             = true
vim.opt.relativenumber = true

vim.opt.tabstop        = 4
vim.opt.softtabstop    = 4
vim.opt.shiftwidth     = 4
vim.opt.expandtab      = true
vim.opt.smartindent    = true

vim.opt.ignorecase     = true
vim.opt.smartcase      = true

vim.opt.wrap           = false

vim.opt.swapfile       = false
vim.opt.backup         = false
vim.opt.undodir        = os.getenv("HOME") .. "/.vim/undodir"
vim.opt.undofile       = true

vim.opt.hlsearch       = false
vim.opt.incsearch      = true

vim.opt.termguicolors  = true

vim.opt.scrolloff      = 8
vim.opt.signcolumn     = "yes"

vim.opt.updatetime     = 50

vim.opt.colorcolumn    = "80"
vim.opt.isfname:append("@-@")

vim.cmd([[
         augroup LineNumber
           autocmd InsertEnter * :set norelativenumber
           autocmd InsertLeave * :set relativenumber
         augroup END
       ]])

vim.api.nvim_create_autocmd({ "BufEnter" }, {
    pattern = { "*.txt", "*.md" },
    callback = function()
        vim.opt.wrap = true
    end
})
