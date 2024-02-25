local scripts = require("scripts")

vim.keymap.set("n", "<leader>pv", vim.cmd.Ex)                                                                       -- Nvim Exit file
vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")                                                                        -- Nvim Move selection down
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")                                                                        -- Nvim Move selection up
vim.keymap.set("n", "J", "mzJ`z")                                                                                   -- Nvim Remap 'J' to join line below keeping the cursor on current position
vim.keymap.set("n", "<C-d>", "<C-d>zz")                                                                             -- Nvim Keep cursor in the middle when moving half page down
vim.keymap.set("n", "<C-u>", "<C-u>zz")                                                                             -- Nvim Keep cursor in the middle when moving half page up
vim.keymap.set("n", "n", "nzzzv")                                                                                   -- Nvim Keep cursor in the middle when searching down
vim.keymap.set("n", "N", "Nzzzv")                                                                                   -- Nvim Keep curson in the middle when searching up
vim.keymap.set("x", "<leader>p", [["_dP]])                                                                          -- Nvim Delete and paste before cursor
vim.keymap.set("n", "<leader>y", [["+y]])                                                                           -- Nvim Copy to system clipboard
vim.keymap.set("n", "<leader>Y", [["+Y]])                                                                           -- Nvim Copy until end of line to system clipboard
vim.keymap.set("v", "<leader>d", [["_d]])                                                                           -- Nvim Delete (not cut)
vim.keymap.set("i", "<C-c>", "<Esc>")                                                                               -- Nvim On vertical edit mode, Ctrl-C exits insert mode and keep the vertical content

vim.keymap.set("n", "<C-k>", "<cmd>cnext<CR>zz")                                                                    -- Nvim Quickfix next
vim.keymap.set("n", "<C-j>", "<cmd>cprev<CR>zz")                                                                    -- Nvim Quickfix previous
vim.keymap.set("n", "<leader>k", "<cmd>lnext<CR>zz")                                                                -- Nvim Quickfix next at current window
vim.keymap.set("n", "<leader>j", "<cmd>lprev<CR>zz")                                                                -- Nvim Quickfix previous at current window

vim.keymap.set("n", "<leader>s", [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]])                            -- Nvim Replace current word with regex
vim.keymap.set("n", "<leader>x", "<cmd>!chmod +x %<CR>", { silent = true })                                         -- Nvim Make current file executable
vim.keymap.set("n", "<leader>vpp", "<cmd>e " .. os.getenv("HOME") .. "/.config/nvim<CR>")                           -- Nvim Open config folder
vim.keymap.set("n", "<leader><leader>", vim.cmd.so)                                                                 -- Nvim Run command 'so'

vim.keymap.set("n", "<leader>m", scripts.nvim.run_make)                                                             -- Nvim Custom
vim.keymap.set("n", "<leader>n", scripts.nvim.create_file)                                                          -- Create a new file without editing
vim.keymap.set("v", "<leader>'", [[<Esc>`>a'<Esc>`<i'<Esc>vi']])                                                    -- Nvim Add single quote ''
vim.keymap.set("v", "<leader>B", [[<Esc>`>a}<Esc>`<i{<Esc>viB]])                                                    -- Nvim Add curly braces {}
vim.keymap.set("v", "<leader>[", [[<Esc>`>a]<Esc>`<i[<Esc>vi[]])                                                    -- Nvim Add square braces []
vim.keymap.set("v", "<leader>\"", [[<Esc>`>a"<Esc>`<i"<Esc>vi"]])                                                   -- Nvim Add double quotes ""
vim.keymap.set("v", "<leader>b", [[<Esc>`>a)<Esc>`<i(<Esc>vib]])                                                    -- Nvim Add braces ()
vim.keymap.set("n", "<C-f>", "<cmd>silent !tmux neww ~/.config/scripts/tmux-sessionizer.sh<CR>")                    -- Nvim tmux Search session (create if not exist)

vim.keymap.set('n', '<C-p>', scripts.telescope.git_files, {})                                                       -- Telescope
vim.keymap.set('n', '<leader>pf', scripts.telescope.find_files, {})                                                 -- Telescope
vim.keymap.set('n', '<leader>ps', scripts.telescope.grep_string)                                                    -- Telescope
vim.keymap.set('n', '<leader>vh', scripts.telescope.help_tags)                                                      -- Telescope

vim.keymap.set("i", "<C-h>", vim.lsp.buf.signature_help)                                                            -- LSP Signature help
vim.keymap.set("n", "<leader>f", vim.lsp.buf.format)                                                                -- LSP to format
vim.keymap.set("n", "<leader>vca", vim.lsp.buf.code_action)                                                         -- LSP Code Action??
vim.keymap.set("n", "<leader>vd", vim.diagnostic.open_float)                                                        -- LSP Open float??
vim.keymap.set("n", "<leader>vrn", vim.lsp.buf.rename)                                                              -- LSP Rename
vim.keymap.set("n", "<leader>vrr", vim.lsp.buf.references)                                                          -- LSP Show references
vim.keymap.set("n", "<leader>vws", vim.lsp.buf.workspace_symbol)                                                    -- LSP Workspace Symbol
vim.keymap.set("n", "K", vim.lsp.buf.hover)                                                                         -- LSP Show doc
vim.keymap.set("n", "[d", vim.diagnostic.goto_next)                                                                 -- LSP Go to next diagnostic vim.keymap.set("n", "]d", function() vim.diagnostic.goto_prev() end) -- LSP Go to previous diagnostic
vim.keymap.set("n", "gd", vim.lsp.buf.definition)                                                                   -- LSP Get definition
vim.keymap.set("v", "<leader>vca", vim.lsp.buf.code_action)                                                         -- LSP Code Action??

vim.keymap.set("n", "<C-e>", scripts.harpoon.toggle_telescope)                                                      -- Harpoon
vim.keymap.set("n", "<C-j>", scripts.harpoon.next)                                                                  -- Harpoon
vim.keymap.set("n", "<C-k>", scripts.harpoon.prev)                                                                  -- Harpoon
vim.keymap.set("n", "<leader>a", scripts.harpoon.append)                                                            -- Harpoon

vim.keymap.set("n", "<leader>nc", "<cmd>Neogen<CR>")                                                                -- Neogen Generate docstrings

vim.keymap.set("n", "<leader>gs", vim.cmd.Git)                                                                      -- Fugitive Open git window
vim.keymap.set("n", "<leader>gi", scripts.gitignore.generate)                                                       -- Gitignore generate .gitignore file

vim.keymap.set("n", "<leader>vdb", scripts.dap.load_launchjs)                                                       -- DAP Load launch.json

vim.keymap.set("n", "<leader>xq", "<cmd>TroubleToggle document_diagnostics<cr>", { silent = true, noremap = true }) -- Trouble toggle diagnostics

vim.keymap.set("n", "<leader>u", vim.cmd.UndotreeToggle)                                                            -- Undotree

vim.keymap.set('n', '<F5>', scripts.dap.continue)                                                                   -- DAP
vim.keymap.set('n', '<F6>', scripts.dap.pause)                                                                      -- DAP
vim.keymap.set('n', '<F7>', scripts.dap.restart)                                                                    -- DAP
vim.keymap.set('n', '<F8>', scripts.dap.terminate)                                                                  -- DAP
vim.keymap.set('n', '<F10>', scripts.dap.step_over)                                                                 -- DAP
vim.keymap.set('n', '<F11>', scripts.dap.step_into)                                                                 -- DAP
vim.keymap.set('n', '<F12>', scripts.dap.step_out)                                                                  -- DAP
vim.keymap.set('n', '<Leader>db', scripts.dap.breakpoint)                                                    -- DAP
vim.keymap.set('n', '<Leader>dc', scripts.dap.conditional_breakpoint)                                               -- DAP
vim.keymap.set('n', '<Leader>dl', scripts.dap.log_breakpoint)                                                       -- DAP

vim.keymap.set("n", "<leader>ut", scripts.neotest.summary_toggle)                                                   -- Neotest
vim.keymap.set("n", "<leader>ud", scripts.neotest.debug_current)                                                   -- Neotest
