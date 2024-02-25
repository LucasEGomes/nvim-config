local telescope = require('telescope.builtin')

local function grep_string()
    telescope.grep_string({ search = vim.fn.input("Grep > ") })
end

return {
    find_files = telescope.find_files,
    git_files = telescope.git_files,
    grep_string = grep_string,
    help_tags = telescope.help_tags,
}
