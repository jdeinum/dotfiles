local vim = vim

-- Disable home row keys
vim.keymap.set("i", "<up>", "<nop>")
vim.keymap.set("i", "<down>", "<nop>")
vim.keymap.set("i", "<left>", "<nop>")
vim.keymap.set("i", "<right>", "<nop>")

-- Left and right can switch buffers
vim.keymap.set("n", "<left>", ":bp<cr>")
vim.keymap.set("n", "<right>", ":bn<cr>")

-- <leader><leader> switches between buffers
vim.keymap.set("n", "<leader><leader>", "<c-^>")

-- Ctrl+h to stop searching
vim.keymap.set("v", "<C-h>", ":nohlsearch<cr>")
vim.keymap.set("n", "<C-h>", ":nohlsearch<cr>")

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
vim.keymap.set("n", "<leader><esc><esc>", ":tabclose<CR>")

-- hard clear search
vim.keymap.set("", "<c-c>", ":let @/ = ''<cr>")
vim.keymap.set("", "F1", "<nop>")

vim.keymap.set("v", "<leader>y", '"+y')
vim.keymap.set("n", "<leader>y", '"+y')
vim.keymap.set("n", "<leader>Y", '"+yg')
vim.keymap.set("n", "<leader>yy", '"+yy')

vim.keymap.set("n", "<leader>p", '"+p')
vim.keymap.set("n", "<leader>P", '"+P')
vim.keymap.set("v", "<leader>p", '"+p')
vim.keymap.set("v", "<leader>P", '"+P')

vim.keymap.set("i", "<C-l>", "<c-g>u<Esc>[s1z=`]a<c-g>u")
vim.keymap.set("n", "<leader>vo", "<cmd> DiffviewFileHistory %<CR>")
vim.keymap.set("n", "<leader>vp", "<cmd> DiffviewFileHistory<CR>")
vim.keymap.set("n", "<leader>vl", "<cmd> DiffviewOpen<CR>")
vim.keymap.set("n", "<leader>vk", "<cmd> DiffviewClose<CR>")

vim.keymap.set("n", "<C-t>", "<cmd> Tab /[a-zA-Z0-9] <CR>")
