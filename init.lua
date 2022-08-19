------------------------GLOBALS + LEADERS--------------------------------------
local vim = vim
local g = vim.g
local fn = vim.fn
local o = vim.o
local bo = vim.bo
local wo = vim.wo
local status_ok

g.mapleader = " "
g.maplocalleader = " "

------------------------PACKER-------------------------------------------------
-- Automatically install packer if you don't have it
local install_path = fn.stdpath "data" .. "/site/pack/packer/start/packer.nvim"
if fn.empty(fn.glob(install_path)) > 0 then
  PACKER_BOOTSTRAP = fn.system {
    "git",
    "clone",
    "--depth",
    "1",
    "https://github.com/wbthomason/packer.nvim",
    install_path,
  }
  print "Installing packer! Close and reopen Neovim..."
  vim.cmd [[packadd packer.nvim]]
end

-- Use a protected call so we don't error out on first use
local packer
status_ok, packer = pcall(require, "packer")
if not status_ok then
  return
end


packer.init {
  display = {
    open_fn = function()
      return require("packer.util").float { border = "rounded" }
    end,
  },
}

-- Install Plugins
packer.startup(function(use)
  use "wbthomason/packer.nvim"
  use "nvim-lua/plenary.nvim"
  use "windwp/nvim-autopairs"
  use "numToStr/Comment.nvim"
  use "kyazdani42/nvim-web-devicons"
  use "kyazdani42/nvim-tree.lua"
  use "nvim-lualine/lualine.nvim"
  use 'bluz71/vim-nightfly-guicolors'
  use 'folke/tokyonight.nvim'
  use 'shaunsingh/solarized.nvim'
  use { "ellisonleao/gruvbox.nvim" }
  use 'folke/trouble.nvim'

  use {
    "folke/trouble.nvim",
    requires = "kyazdani42/nvim-web-devicons",
    config = function()
      require("trouble").setup {}
    end
  }

  use "hrsh7th/nvim-cmp"
  use "hrsh7th/cmp-buffer"
  use "hrsh7th/cmp-path"
  use "hrsh7th/cmp-cmdline"
  use "saadparwaiz1/cmp_luasnip"
  use "hrsh7th/cmp-nvim-lsp"

  use "L3MON4D3/LuaSnip"
  use "rafamadriz/friendly-snippets"

  use "neovim/nvim-lspconfig"
  use "williamboman/nvim-lsp-installer"


  use "nvim-telescope/telescope.nvim"
  use 'nvim-telescope/telescope-dap.nvim'
  use { 'nvim-telescope/telescope-fzf-native.nvim', run = 'make' }
  use { "rcarriga/nvim-dap-ui", requires = { "mfussenegger/nvim-dap" } }

  use "lewis6991/gitsigns.nvim"
  use { 'sindrets/diffview.nvim', requires = 'nvim-lua/plenary.nvim' }
  -- use { 'pwntester/octo.nvim', requires = { 'nvim-lua/plenary.nvim', 'nvim-telescope/telescope.nvim', 'kyazdani42/nvim-web-devicons', }, config = function() require "octo".setup() end }

  use { 'nvim-treesitter/nvim-treesitter', run = ':TSUpdate' }
  use 'mfussenegger/nvim-dap'
  use 'theHamsta/nvim-dap-virtual-text'

  use { "nvim-neotest/neotest", requires = { "nvim-lua/plenary.nvim", "nvim-treesitter/nvim-treesitter", "antoinemadec/FixCursorHold.nvim" } }
  use { 'akinsho/bufferline.nvim', tag = "v2.*", requires = 'kyazdani42/nvim-web-devicons' }
  use { 'machakann/vim-highlightedyank' }
  use { 'rhysd/vim-clang-format' }
  use { 'godlygeek/tabular' }
  use 'ggandor/lightspeed.nvim'
  use 'voldikss/vim-floaterm'
  use 'elixir-editors/vim-elixir'

  use({ 'scalameta/nvim-metals', requires = { "nvim-lua/plenary.nvim" } })

  if PACKER_BOOTSTRAP then
    require("packer").sync()
  end
end)

------------------------OPTIONS------------------------------------------------
o.termguicolors = true
o.background = 'dark'
vim.cmd("colorscheme nightfly")
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
wo.colorcolumn = '100'
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

vim.keymap.set('n', '<leader><esc><esc>', ':tabclose<CR>')

vim.cmd [[
nnoremap <leader>o :e <C-R>=expand("%:p:h") . "/" <CR>
" Very magic by default
nnoremap ? ?\v
nnoremap / /\v
cnoremap %s/ %sm/
]]

vim.keymap.set("", "<c-c>", ":let @/ = ''<cr>")


-------------------------LSP---------------------------------------------------
-- make sure the installer is installed
local lsp_installer, lspconfig

status_ok, lsp_installer = pcall(require, "nvim-lsp-installer")
if not status_ok then
  return
end

status_ok, lspconfig = pcall(require, "lspconfig")
if not status_ok then
  print "couldn't find lspconfig!"
  return
end

local servers = { "sumneko_lua", "rust_analyzer", "clangd", "jedi_language_server", "csharp_ls" }
lsp_installer.setup {
  ensure_installed = servers
}

for _, server in pairs(servers) do

  -- default options
  local opts = {
    on_attach = require("user.lsp.handlers").on_attach,
    capabilities = require("user.lsp.handlers").capabilities,
  }

  lspconfig[server].setup(opts)
end


-- Replace the following with the path to your installation
local path_to_elixirls = vim.fn.expand("~/.config/elixirls/language_server.sh")

lspconfig.elixirls.setup({
  cmd = { path_to_elixirls },
  on_attach = require("user.lsp.handlers").on_attach,
  capabilities = require("user.lsp.handlers").capabilities,

  settings = {
    elixirLS = {
      -- I choose to disable dialyzer for personal reasons, but
      -- I would suggest you also disable it unless you are well
      -- aquainted with dialzyer and know how to use it.
      dialyzerEnabled = false,
      -- I also choose to turn off the auto dep fetching feature.
      -- It often get's into a weird state that requires deleting
      -- the .elixir_ls directory and restarting your editor.
      fetchDeps = false
    }
  }
})




lspconfig.setup = function()
  local signs = {
    { name = "DiagnosticSignError", text = "" },
    { name = "DiagnosticSignWarn", text = "" },
    { name = "DiagnosticSignHint", text = "" },
    { name = "DiagnosticSignInfo", text = "" },
  }

  for _, sign in ipairs(signs) do
    vim.fn.sign_define(sign.name, { texthl = sign.name, text = sign.text, numhl = "" })
  end

  local config = {
    -- disable virtual text
    virtual_text = false,
    -- show signs
    signs = {
      active = signs,
    },
    update_in_insert = true,
    underline = true,
    severity_sort = true,
    float = {
      focusable = false,
      style = "minimal",
      border = "rounded",
      source = "always",
      header = "",
      prefix = "",
    },
  }

  vim.diagnostic.config(config)

  vim.lsp.handlers["textDocument/hover"] = vim.lsp.with(vim.lsp.handlers.hover, {
    border = "rounded",
  })

  vim.lsp.handlers["textDocument/signatureHelp"] = vim.lsp.with(vim.lsp.handlers.signature_help, {
    border = "rounded",
  })
end

local function lsp_keymaps(bufnr)
  local opts = { noremap = true, silent = true }
  vim.api.nvim_buf_set_keymap(bufnr, "n", "gD", "<cmd>lua vim.lsp.buf.declaration()<CR>", opts)
  vim.api.nvim_buf_set_keymap(bufnr, "n", "gd", "<cmd>lua vim.lsp.buf.definition()<CR>", opts)
  vim.api.nvim_buf_set_keymap(bufnr, "n", "K", "<cmd>lua vim.lsp.buf.hover()<CR>", opts)
  vim.api.nvim_buf_set_keymap(bufnr, "n", "gi", "<cmd>lua vim.lsp.buf.implementation()<CR>", opts)
  vim.api.nvim_buf_set_keymap(bufnr, "n", "<C-k>", "<cmd>lua vim.lsp.buf.signature_help()<CR>", opts)
  vim.api.nvim_buf_set_keymap(bufnr, "n", "<leader>rn", "<cmd>lua vim.lsp.buf.rename()<CR>", opts)
  vim.api.nvim_buf_set_keymap(bufnr, "n", "gr", "<cmd>lua require('telescope.builtin').lsp_references()<CR>", opts)
  vim.api.nvim_buf_set_keymap(bufnr, "n", "<leader>a", "<cmd>lua vim.lsp.buf.code_action()<CR>", opts)
  vim.api.nvim_buf_set_keymap(bufnr, "n", "<leader>e", "<cmd>lua vim.diagnostic.open_float()<CR>", opts)
  vim.api.nvim_buf_set_keymap(bufnr, "n", "[d", '<cmd>lua vim.diagnostic.goto_prev({ border = "rounded" })<CR>', opts)
  vim.api.nvim_buf_set_keymap(bufnr, "n", "gl", '<cmd>lua vim.lsp.diagnostic.show_line_diagnostics({ border = "rounded" })<CR>', opts)
  vim.api.nvim_buf_set_keymap(bufnr, "n", "]d", '<cmd>lua vim.diagnostic.goto_next({ border = "rounded" })<CR>', opts)
  vim.api.nvim_buf_set_keymap(bufnr, "n", "<leader>q", "<cmd>lua vim.diagnostic.setloclist()<CR>", opts)
  vim.api.nvim_buf_set_keymap(bufnr, "n", "<space>f", "<cmd>lua vim.lsp.buf.formatting()<CR>", opts)
end

lspconfig.on_attach = function(client, bufnr)
  lsp_keymaps(bufnr)
end

local capabilities = vim.lsp.protocol.make_client_capabilities()

local cmp_nvim_lsp
status_ok, cmp_nvim_lsp = pcall(require, "cmp_nvim_lsp")
if not status_ok then
  return
end

lspconfig.capabilities = cmp_nvim_lsp.update_capabilities(capabilities)

-------------------------CMP---------------------------------------------------
local cmp_status_ok, cmp = pcall(require, "cmp")


if not cmp_status_ok then
  return
end

local snip_status_ok, luasnip = pcall(require, "luasnip")
if not snip_status_ok then
  return
end

cmp.setup({
  snippet = {
    expand = function(args)
      require('luasnip').lsp_expand(args.body) -- For `luasnip` users.
    end,
  },
  window = {
    completion = cmp.config.window.bordered(),
    documentation = cmp.config.window.bordered(),
  },
  mapping = cmp.mapping.preset.insert({
    ['<C-k>'] = cmp.mapping.scroll_docs(-4),
    ['<C-f>'] = cmp.mapping.scroll_docs(4),
    ['<Tab>'] = cmp.mapping.complete(),
    ['<C-e>'] = cmp.mapping.abort(),
    ['<Tab>'] = cmp.mapping.confirm({ select = true }),
    ['<c-b>'] = cmp.mapping(function(fallback)
      if luasnip.jumpable(1) then
        luasnip.jump(1)
      end
    end),
    ['<c-x>'] = cmp.mapping(function(fallback)
      if luasnip.jumpable(-1) then
        luasnip.jump(-1)
      end
    end)
  }),

  sources = cmp.config.sources({
    { name = 'luasnip' }, -- For luasnip users.
    { name = 'nvim_lsp' },
    { name = 'buffer' },
    { name = "path" },
  })
})


-- Setup lspconfig.
local on_attach = function(client, bufnr)
  local function buf_set_keymap(...) vim.api.nvim_buf_set_keymap(bufnr, ...) end

  local function buf_set_option(...) vim.api.nvim_buf_set_option(bufnr, ...) end

  --Enable completion triggered by <c-x><c-o>
  buf_set_option('omnifunc', 'v:lua.vim.lsp.omnifunc')

  -- Mappings.
  local opts = { noremap = true, silent = true }

  -- See `:help vim.lsp.*` for documentation on any of the below functions
  buf_set_keymap('n', 'gD', '<Cmd>lua vim.lsp.buf.declaration()<CR>', opts)
  buf_set_keymap('n', 'gd', '<Cmd>lua vim.lsp.buf.definition()<CR>', opts)
  buf_set_keymap('n', 'K', '<Cmd>lua vim.lsp.buf.hover()<CR>', opts)
  buf_set_keymap('n', 'gi', '<cmd>lua vim.lsp.buf.implementation()<CR>', opts)
  buf_set_keymap('n', '<C-k>', '<cmd>lua vim.lsp.buf.signature_help()<CR>', opts)
  buf_set_keymap('n', '<space>D', '<cmd>lua vim.lsp.buf.type_definition()<CR>', opts)
  buf_set_keymap('n', '<space>r', '<cmd>lua vim.lsp.buf.rename()<CR>', opts)
  buf_set_keymap('n', '<space>a', '<cmd>lua vim.lsp.buf.code_action()<CR>', opts)
  buf_set_keymap('n', 'gr', '<cmd>lua vim.lsp.buf.references()<CR>', opts)
  buf_set_keymap('n', '<space>e', '<cmd>lua vim.diagnostic.open_float()<CR>', opts)
  buf_set_keymap('n', '[d', '<cmd>lua vim.diagnostic.goto_prev()<CR>', opts)
  buf_set_keymap('n', ']d', '<cmd>lua vim.diagnostic.goto_next()<CR>', opts)
  buf_set_keymap('n', '<space>q', '<cmd>lua vim.diagnostic.set_loclist()<CR>', opts)
  buf_set_keymap("n", "<space>f", "<cmd>lua vim.lsp.buf.formatting()<CR>", opts)
  vim.keymap.set('n', 'gA', ':Telescope lsp_range_code_actions<CR>')

end

-- Use buffer source for `/` (if you enabled `native_menu`, this won't work anymore).
cmp.setup.cmdline('/', {
  mapping = cmp.mapping.preset.cmdline(),
  sources = {
    { name = 'buffer' }
  }
})

-- Use cmdline & path source for ':' (if you enabled `native_menu`, this won't work anymore).
cmp.setup.cmdline(':', {
  mapping = cmp.mapping.preset.cmdline(),
  sources = cmp.config.sources({
    { name = 'path' }
  }, {
    { name = 'cmdline' }
  })
})


-------------------------TELESCOPE---------------------------------------------
local telescope
status_ok, telescope = pcall(require, "telescope")
if not status_ok then
  print "Error: Can't find Telescope!"
  return
end


local telescope_actions = require("telescope.actions.set")

local fixfolds = {
  hidden = true,
  attach_mappings = function(_)
    telescope_actions.select:enhance({
      post = function()
        vim.cmd(":normal! zx")
      end,
    })
    return true
  end,
}

local actions = require("telescope.actions")

telescope.setup {
  pickers = {
    buffers = fixfolds,
    find_files = fixfolds,
    git_files = fixfolds,
    grep_string = fixfolds,
    live_grep = fixfolds,
    oldfiles = fixfolds,
  }
}

-- nvim-telescope/telescope.nvim
_G.telescope_find_files_in_path = function(path)
  local _path = path or vim.fn.input("Dir: ", "", "dir")
  require("telescope.builtin").find_files({ search_dirs = { _path } })
end
_G.telescope_live_grep_in_path = function(path)
  local _path = path or vim.fn.input("Dir: ", "", "dir")
  require("telescope.builtin").live_grep({ search_dirs = { _path } })
end
_G.telescope_files_or_git_files = function()
  local utils = require('telescope.utils')
  local builtin = require('telescope.builtin')
  local _, ret, _ = utils.get_os_command_output({ 'git', 'rev-parse', '--is-inside-work-tree' })
  if ret == 0 then
    builtin.git_files()
  else
    builtin.find_files()
  end
end
vim.keymap.set('n', '<leader>fD', function() telescope_live_grep_in_path() end)
vim.keymap.set('n', '<leader>fF', function() telescope_files_or_git_files() end)
vim.keymap.set('n', '<leader>fd', function() telescope_find_files_in_path() end)
vim.keymap.set('n', '<leader>ft', ':Telescope current_buffer_fuzzy_find<CR>')
vim.keymap.set('n', '<leader>fn', ':Telescope find_files<CR>')
vim.keymap.set('n', '<leader>fr', ':Telescope lsp_references<CR>')
vim.keymap.set('n', '<leader>fg', ':Telescope treesitter<CR>')
vim.keymap.set('n', '<leader>fj', ':Telescope buffers<CR>')
vim.keymap.set('n', '<leader>fs', ':Telescope lsp_document_symbols<CR>')
vim.keymap.set('n', '<leader>ff', ':Telescope live_grep<CR>')
vim.keymap.set('n', '<leader>FF', ':Telescope grep_string<CR>')

-------------------------COMMENT-----------------------------------------------
local comment
status_ok, comment = pcall(require, "Comment")
if not status_ok then
  return
end

comment.setup {}
-------------------------GIT-SIGNS---------------------------------------------
local function diffThisBranch()
  local branch = vim.fn.input("Branch: ", "")
  require "gitsigns".diffthis(branch)
end

require('gitsigns').setup({
  current_line_blame = true,
  on_attach = function(bufnr)
    -- Navigation
    vim.keymap.set('n', ']c', "&diff ? ']c' : '<cmd>Gitsigns next_hunk<CR>'", { expr = true })
    vim.keymap.set('n', '[c', "&diff ? '[c' : '<cmd>Gitsigns prev_hunk<CR>'", { expr = true })

    -- Actions
    vim.keymap.set('n', '<leader>hs', ':Gitsigns stage_hunk<CR>')
    vim.keymap.set('v', '<leader>hs', ':Gitsigns stage_hunk<CR>')
    vim.keymap.set('n', '<leader>hr', ':Gitsigns reset_hunk<CR>')
    vim.keymap.set('v', '<leader>hr', ':Gitsigns reset_hunk<CR>')
    vim.keymap.set('n', '<leader>hS', '<cmd>Gitsigns stage_buffer<CR>')
    vim.keymap.set('n', '<leader>hu', '<cmd>Gitsigns undo_stage_hunk<CR>')
    vim.keymap.set('n', '<leader>hR', '<cmd>Gitsigns reset_buffer<CR>')
    vim.keymap.set('n', '<leader>hp', '<cmd>Gitsigns preview_hunk<CR>')
    vim.keymap.set('n', '<leader>hb', function() require "gitsigns".blame_line { full = true } end)
    vim.keymap.set('n', '<leader>tb', '<cmd>Gitsigns toggle_current_line_blame<CR>')
    vim.keymap.set('n', '<leader>hd', '<cmd>Gitsigns diffthis<CR>')
    vim.keymap.set('n', '<leader>hD', function() require "gitsigns".diffthis("~") end)
    vim.keymap.set('n', '<leader>hm', function() require "gitsigns".diffthis("main") end)
    vim.keymap.set('n', '<leader>hM', diffThisBranch)
    vim.keymap.set('n', '<leader>td', '<cmd>Gitsigns toggle_deleted<CR>')
    vim.keymap.set('n', '<leader>ha', ':DiffviewOpen<CR>')


    -- Text object
    vim.keymap.set('o', 'ih', ':<C-U>Gitsigns select_hunk<CR>')
    vim.keymap.set('x', 'ih', ':<C-U>Gitsigns select_hunk<CR>')
  end
})


vim.g.floaterm_width = 0.95
vim.g.floaterm_height = 0.95
vim.keymap.set('n', '<leader>g', ':FloatermNew gitui<CR>')

-------------------------DAP---------------------------------------------------
-- mfussenegger/nvim-dap
local dap = require('dap')


dap.defaults.fallback.terminal_win_cmd = '20split new'
vim.fn.sign_define('DapBreakpoint', { text = '*', texthl = '', linehl = '', numhl = '' })
vim.fn.sign_define('DapBreakpointRejected', { text = '^', texthl = '', linehl = '', numhl = '' })
vim.fn.sign_define('DapStopped', { text = '>', texthl = '', linehl = '', numhl = '' })

vim.keymap.set('n', '<leader>dh', function() require "dap".toggle_breakpoint() end)
vim.keymap.set('n', '<leader>dH', ":lua require'dap'.set_breakpoint(vim.fn.input('Breakpoint condition: '))<CR>")
vim.keymap.set('n', '<A-k>', function() require "dap".step_out() end)
vim.keymap.set('n', "<A-l>", function() require "dap".step_into() end)
vim.keymap.set('n', '<A-j>', function() require "dap".step_over() end)
vim.keymap.set('n', '<A-h>', function() require "dap".continue() end)
vim.keymap.set('n', '<leader>dn', function() require "dap".run_to_cursor() end)
vim.keymap.set('n', '<leader>dc', function() require "dap".terminate() end)
vim.keymap.set('n', '<leader>dR', function() require "dap".clear_breakpoints() end)
vim.keymap.set('n', '<leader>de', function() require "dap".set_exception_breakpoints({ "all" }) end)
vim.keymap.set('n', '<leader>di', function() require "dap.ui.widgets".hover() end)
vim.keymap.set('n', '<leader>d?', function() local widgets = require "dap.ui.widgets"; widgets.centered_float(widgets.scopes) end)
vim.keymap.set('n', '<leader>dk', ':lua require"dap".up()<CR>zz')
vim.keymap.set('n', '<leader>dj', ':lua require"dap".down()<CR>zz')
vim.keymap.set('n', '<leader>dr', ':lua require"dap".repl.toggle({}, "vsplit")<CR><C-w>l')

-- nvim-telescope/telescope-dap.nvim
require('telescope').load_extension('dap')
vim.keymap.set('n', '<leader>ds', ':Telescope dap frames<CR>')
vim.keymap.set('n', '<leader>dc', ':Telescope dap commands<CR>')
vim.keymap.set('n', '<leader>db', ':Telescope dap list_breakpoints<CR>')
vim.keymap.set('n', '<leader>df', ':Telescope dap variables<CR>')


-- C/Rust/C++
dap.adapters.lldb = {
  type = 'executable',
  command = '/usr/bin/lldb-vscode', -- adjust as needed, must be absolute path
  name = 'lldb'
}

dap.configurations.cpp = {
  {
    name = 'Launch',
    type = 'lldb',
    request = 'launch',
    program = function()
      return vim.fn.input('Path to executable: ', vim.fn.getcwd() .. '/', 'file')
    end,
    cwd = '${workspaceFolder}',
    stopOnEntry = false,
    args = {},
  },
}

-- If you want to use this for Rust and C, add something like this:

dap.configurations.c = dap.configurations.cpp
dap.configurations.rust = dap.configurations.cpp

-- elixir
dap.adapters.mix_task = {
  type = 'executable',
  command = '~/.config/elixirls/debugger.sh', -- debugger.bat for windows
  args = {}
}

dap.configurations.elixir = {
  {
    type = "mix_task",
    name = "mix test",
    task = 'test',
    taskArgs = { "--trace" },
    request = "launch",
    startApps = true, -- for Phoenix projects
    projectDir = "${workspaceFolder}",
    requireFiles = {
      "test/**/test_helper.exs",
      "test/**/*_test.exs"
    }
  },
}


-- C#
dap.adapters.coreclr = {
  type = 'executable',
  command = '/usr/bin/netcoredbg',
  args = { '--interpreter=vscode' }
}

dap.configurations.cs = {
  {
    type = "coreclr",
    name = "launch - netcoredbg",
    request = "launch",
    program = function()
      return vim.fn.input('Path to dll', vim.fn.getcwd() .. '/bin/Debug/', 'file')
    end,
  },
}

-- completion inside DAP REPL
require("cmp").setup.filetype({ "dap-repl", "dapui_watches" }, {
  sources = {
    { name = "dap" },
  },
})


require("nvim-dap-virtual-text").setup()






-------------------------TREE--------------------------------------------------
require('nvim-tree').setup({
  hijack_cursor = true,
  update_focused_file = { enable = true },
  view = {
    width = 60
  }
})
vim.keymap.set('n', '\\', ':NvimTreeToggle<CR>', { silent = true })

vim.keymap.set('n', '<leader>w', ':w<CR>')


-------------------------OTHERS------------------------------------------------
require("nvim-autopairs").setup {}
require("lualine").setup {}
require 'nvim-treesitter.configs'.setup {
  -- A list of parser names, or "all"
  ensure_installed = { "c", "lua", "rust", "elixir", "c_sharp" },

  -- Install parsers synchronously (only applied to `ensure_installed`)
  sync_install = false,

  -- Automatically install missing parsers when entering buffer
  auto_install = true,
}

-- require('bufferline').setup {
--   options = {
--     mode = "tabs"
--   }
-- }









-------------------------NEOTEST-----------------------------------------------
-- TODO: Get Debug Adapters















-------------------------AUTOCOMMANDS------------------------------------------
vim.cmd [[
au BufReadPost * if expand('%:p') !~# '\m/\.git/' && line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif
autocmd BufRead *.plot set filetype=gnuplot
autocmd BufRead *.md set filetype=markdown
autocmd BufRead *.lds set filetype=ld
autocmd BufRead *.tex set filetype=tex
autocmd BufRead *.txt set filetype=text
autocmd Filetype tex setlocal spell
au BufRead,BufNewFile * setlocal textwidth=80
autocmd BufRead *.orig set readonly
autocmd BufRead *.pacnew set readonly
autocmd InsertLeave * set nopaste
]]




local metals_config = require("metals").bare_config()

-- Example of settings
metals_config.settings = {
  showImplicitArguments = true,
  excludedPackages = { "akka.actor.typed.javadsl", "com.github.swagger.akka.javadsl" },
}


local api = vim.api
api.nvim_create_autocmd("FileType", {
  -- NOTE: You may or may not want java included here. You will need it if you
  -- want basic Java support but it may also conflict if you are using
  -- something like nvim-jdtls which also works on a java filetype autocmd.
  pattern = { "scala", "sbt", "java" },
  callback = function()
    require("metals").initialize_or_attach(metals_config)
  end,
  group = nvim_metals_group,
})
