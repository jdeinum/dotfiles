-- All of my LSP code actions

local keymap = vim.keymap.set
local saga = require("lspsaga")

saga.init_lsp_saga({
	code_action_lightbulb = {
		enable = false,
		enable_in_insert = false,
		cache_code_action = true,
		sign = true,
		update_time = 150,
		sign_priority = 20,
		virtual_text = true,
	},
})

-- run gitui with leader gg
local term = require("lspsaga.floaterm")
vim.keymap.set("t", "<ESC>", "<C-\\><C-n><cmd>Lspsaga close_floaterm<CR>", { silent = true })
vim.keymap.set("n", "<leader>gg", "<cmd>Lspsaga open_floaterm gitui<CR>", { silent = true })
vim.keymap.set("t", "q", "<C-\\><C-n><cmd>Lspsaga close_floaterm<CR>", { silent = true })

-- run web search with leader ww
-- keeping this commented out until there is support for passing in parameters
-- vim.keymap.set("n", "<leader>ww", "<cmd>Lspsaga open_floaterm ddgr -n 5<CR>", { silent = true })

-- Lsp finder find the symbol definition implmement reference
keymap("n", "gh", "<cmd>Lspsaga lsp_finder<CR>", { silent = true })

-- Definition preview
keymap("n", "gd", vim.lsp.buf.definition, { silent = true })
keymap("n", "gD", vim.lsp.buf.references, { silent = true })

-- Code action
keymap("n", "<leader>ca", "<cmd>Lspsaga code_action<CR>", { silent = true })
keymap("v", "<leader>ca", "<cmd><C-U>Lspsaga range_code_action<CR>", { silent = true })

-- Rename
keymap("n", "<leader>gr", "<cmd>Lspsaga rename<CR>", { silent = true })

-- Definition preview
keymap("n", "gp", "<cmd>Lspsaga preview_definition<CR>", { silent = true })

-- Show line diagnostics
keymap("n", "<leader>e", "<cmd>Lspsaga show_line_diagnostics<CR>", { silent = true })

-- Show cursor diagnostic
keymap("n", "<leader>cd", "<cmd>Lspsaga show_cursor_diagnostics<CR>", { silent = true })

-- Diagnsotic jump
keymap("n", "[e", "<cmd>Lspsaga diagnostic_jump_next<CR>", { silent = true })
keymap("n", "]e", "<cmd>Lspsaga diagnostic_jump_prev<CR>", { silent = true })

-- Only jump to error
keymap("n", "[E", function()
	require("lspsaga.diagnostic").goto_prev({ severity = vim.diagnostic.severity.ERROR })
end, { silent = true })
keymap("n", "]E", function()
	require("lspsaga.diagnostic").goto_next({ severity = vim.diagnostic.severity.ERROR })
end, { silent = true })

-- Hover Doc
keymap("n", "K", "<cmd>Lspsaga hover_doc<CR>", { silent = true })

-- Outline
keymap("n", "<leader>op", "<cmd>LSoutlineToggle<CR>", { silent = true })

-- Signature help
keymap("n", "gs", "<Cmd>Lspsaga signature_help<CR>", { silent = true })

-- global diagnostic
keymap("n", "<leader>D", "<Cmd>Telescope diagnostics<CR>", { silent = true })
