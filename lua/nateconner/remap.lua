vim.g.mapleader = " "
vim.keymap.set("n", "<leader>pv", vim.cmd.Ex)

vim.keymap.set("v", "kj", "<ESC>")
vim.keymap.set("i", "kj", "<ESC>")

-- Move visual lines up or down
vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")

-- Quote selected text
vim.keymap.set("v", '<leader>"', [[ :s/\%V\(.*\)\%V/"\1"/<CR> ]] )
vim.keymap.set("v", "<leader>'", [[ :s/\%V\(.*\)\%V/'\1'/<CR> ]] )
-- Unquote selected text
-- vim.keymap.set("v", '<leader>r"', [[ :s/\%V\.(.*\).\%V/\1/<CR> ]] )
-- vim.keymap.set("v", "<leader>r'", [[ :s/\%V\.(.*\).\%V/\1/<CR> ]] )


vim.keymap.set("n", "J", "mzJ`z")

-- copy to system clipboard
vim.keymap.set("n", "<leader>y", "\"+y")
vim.keymap.set("v", "<leader>y", "\"+y")

-- for managing windows
vim.keymap.set("n", "<leader>w", "<C-w>")

