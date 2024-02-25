package.path = package.path .. ";" .. os.getenv("HOME") .. "/.config/nvim/?.lua"
require("user_set")
require("lazy_setup")
require("user_keymaps")
require("user_disabled_keymaps")
require("large_file")
