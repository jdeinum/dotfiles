local vim = vim
local g = vim.g
local fn = vim.fn
local o = vim.o
local bo = vim.bo
local wo = vim.wo


o.termguicolors = true
o.background = 'dark'
-- vim.cmd("colorscheme nightfly")
-- vim.cmd("colorscheme nightfox")
vim.cmd("colorscheme duskfox")
-- vim.cmd("colorscheme nordfox")
-- vim.cmd("colorscheme carbonfox")
-- vim.cmd("colorscheme gruvbox")
-- vim.cmd 'colorscheme tokyonight'
o.syntax = 'on'
o.tabstop = 2
o.softtabstop = 2
o.shiftwidth = 2
o.expandtab = true
o.autoindent = true
bo.autoindent = true
bo.smartindent = true
o.undofile = true
o.undodir = "/home/deinum/.vimdid"
wo.colorcolumn = '80'
o.mouse = 'a'
wo.number = true
wo.relativenumber = true
wo.signcolumn = 'yes'
wo.wrap = false
vim.cmd("set nofoldenable")
o.wildmenu = true
o.wildmode = 'list:longest'
o.formatoptions = "tcrqnb"
o.incsearch = true
o.ignorecase = true
o.smartcase = true
o.gdefault = true
o.errorbells = false
o.showmode = false
o.backup = false
o.incsearch = true
o.hidden = true
o.completeopt = 'menuone,noinsert,noselect'
o.timeoutlen = 300
o.encoding = 'utf-8'
o.hidden = true
o.splitright = true
o.splitbelow = true

vim.cmd [[
nnoremap <leader>o :e <C-R>=expand("%:p:h") . "/" <CR>
" Very magic by default
nnoremap ? ?\v
" nnoremap / /\v
cnoremap %s/ %sm/
]]

vim.cmd [[
au BufReadPost * if expand('%:p') !~# '\m/\.git/' && line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif
au BufRead,BufNewFile * setlocal textwidth=80
au FileType markdown setlocal spell
]]




