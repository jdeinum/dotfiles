local vim = vim

-- Left and right can switch buffers
vim.keymap.set("n", "<left>", ":bp<cr>")
vim.keymap.set("n", "<right>", ":bp<cr>")

-- Disable home row keys
vim.keymap.set("", "<up>", "<nop>")
vim.keymap.set("", "<down>", "<nop>")
vim.keymap.set("", "<left>", "<nop>")
vim.keymap.set("", "<right>", "<nop>")

-- <leader><leader> switches between buffers
vim.keymap.set("n", "<leader><leader>", "<c-^>")

-- Ctrl+h to stop searching
vim.keymap.set("v", "<C-h>", ":nohlsearch<cr>")
vim.keymap.set("n", "<C-h>", ":nohlsearch<cr>")

-- Suspend with Ctrl+f
vim.keymap.set("i", "<C-f>", ":sus<cr>")
vim.keymap.set("v", "<C-f>", ":sus<cr>")
vim.keymap.set("n", "<C-f>", ":sus<cr>")

-- Jump to start and end of line using the home row keys
vim.keymap.set("", "H", "^")
vim.keymap.set("", "L", "$")

-- copy / paste
vim.keymap.set("v", "<leader>c", ":w !xsel -ib<cr><cr>")
vim.keymap.set("n", "<leader>p", ":read !xsel --clipboard --output<cr>:")

-- proper search
vim.keymap.set("n", "<silent> n", "nzz")
vim.keymap.set("n", "<silent> N", "Nzz")
vim.keymap.set("n", "<silent> *", "*zz")
vim.keymap.set("n", "<silent> #", "#zz")
vim.keymap.set("n", "<silent> g*", "g*zz")

-- close tab
vim.keymap.set('n', '<leader><esc><esc>', ':tabclose<CR>')

-- hard clear search
vim.keymap.set("", "<c-c>", ":let @/ = ''<cr>")
vim.keymap.set("", "F1", "<nop>")



