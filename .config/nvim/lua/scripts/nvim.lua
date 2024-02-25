local function create_file()
    local filetype = vim.bo.filetype
    if filetype ~= "netrw" then
        return
    end
    local cursor = vim.api.nvim_win_get_cursor(0)
    vim.cmd.new("%:p:h/" .. vim.fn.input("Enter filename: "))
    vim.cmd("wq")
    vim.cmd.Ex()
    vim.api.nvim_win_set_cursor(0, cursor)
end

local function run_make()
    vim.cmd.make("-C %:p:h " .. vim.fn.input("Enter recipe name: "))
end

return {
    create_file = create_file,
    run_make = run_make
}
