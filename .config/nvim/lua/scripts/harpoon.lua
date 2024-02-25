local harpoon = require("harpoon")
local conf    = require("telescope.config").values
local state   = require("telescope.actions.state")
local pickers = require("telescope.pickers")
local finders = require("telescope.finders")


local function get_harpoon_file_paths(harpoon_files)
    local file_paths = {}
    for _, item in ipairs(harpoon_files.items) do
        table.insert(file_paths, item.value)
    end
    return file_paths
end

local function refresh_picker(prompt_bufnr, harpoon_files, index)
    local picker = state.get_current_picker(prompt_bufnr)
    picker.default_selection_index = index
    picker:refresh(finders.new_table({
        results = get_harpoon_file_paths(harpoon_files)
    }))
end

local function remove_harpoon_item(prompt_bufnr, harpoon_files)
    local index = state.get_selected_entry().index
    harpoon_files:removeAt(index)
    if harpoon_files:length() < index then
        index = harpoon_files:length()
    end
    refresh_picker(prompt_bufnr, harpoon_files, index)
end

local function move_down_harpoon_item(prompt_bufnr, harpoon_files)
    local index = state.get_selected_entry().index
    if index < 2 then
        return
    end
    local temp = harpoon_files.items[index]
    harpoon_files.items[index] = harpoon_files.items[index - 1]
    harpoon_files.items[index - 1] = temp
    refresh_picker(prompt_bufnr, harpoon_files, index - 1)
end

local function move_up_harpoon_item(prompt_bufnr, harpoon_files)
    local index = state.get_selected_entry().index
    if index == harpoon_files:length() then
        return
    end
    local temp = harpoon_files.items[index]
    harpoon_files.items[index] = harpoon_files.items[index + 1]
    harpoon_files.items[index + 1] = temp
    refresh_picker(prompt_bufnr, harpoon_files, index + 1)
end

local function toggle_telescope()
    local harpoon_files = harpoon:list()
    pickers.new({}, {
        prompt_title = "Harpoon",
        finder = finders.new_table({
            results = get_harpoon_file_paths(harpoon_files),
        }),
        previewer = conf.file_previewer({}),
        sorter = conf.generic_sorter({}),
        attach_mappings = function(_, map)
            map({ "n", "i" }, "<c-d>", function(prompt_bufnr) remove_harpoon_item(prompt_bufnr, harpoon_files) end)
            map({ "n" }, "<S-k>", function(prompt_bufnr) move_up_harpoon_item(prompt_bufnr, harpoon_files) end)
            map({ "n" }, "<S-j>", function(prompt_bufnr) move_down_harpoon_item(prompt_bufnr, harpoon_files) end)
            return true
        end,
    }):find()
end

return {
    append  = function() harpoon:list():append() end,
    next = function() harpoon:list():next() end,
    prev = function() harpoon:list():prev() end,
    toggle_telescope = toggle_telescope,
}
