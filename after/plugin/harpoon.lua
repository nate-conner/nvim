local mark = require("harpoon.mark")
local ui = require("harpoon.ui")


vim.keymap.set("n", "<leader>g", mark.add_file)
vim.keymap.set("n", "<leader>h", ui.toggle_quick_menu)

vim.keymap.set("n", "<leader>a", function() ui.nav_file(1) end)
vim.keymap.set("n", "<leader>s", function() ui.nav_file(2) end)
vim.keymap.set("n", "<leader>d", function() ui.nav_file(3) end)
vim.keymap.set("n", "<leader>f", function() ui.nav_file(4) end)

