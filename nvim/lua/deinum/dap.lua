local dap = require("dap")

dap.defaults.fallback.terminal_win_cmd = "20split new"
vim.fn.sign_define("DapBreakpoint", { text = "*", texthl = "", linehl = "", numhl = "" })
vim.fn.sign_define("DapBreakpointRejected", { text = "^", texthl = "", linehl = "", numhl = "" })
vim.fn.sign_define("DapStopped", { text = ">", texthl = "", linehl = "", numhl = "" })

vim.keymap.set("n", "<leader>dh", function()
	require("dap").toggle_breakpoint()
end)
vim.keymap.set("n", "<leader>dH", ":lua require'dap'.set_breakpoint(vim.fn.input('Breakpoint condition: '))<CR>")
vim.keymap.set("n", "<A-k>", function()
	require("dap").step_out()
end)
vim.keymap.set("n", "<A-l>", function()
	require("dap").step_into()
end)
vim.keymap.set("n", "<A-j>", function()
	require("dap").step_over()
end)
vim.keymap.set("n", "<A-h>", function()
	require("dap").continue()
end)
vim.keymap.set("n", "<leader>dn", function()
	require("dap").run_to_cursor()
end)
vim.keymap.set("n", "<leader>dc", function()
	require("dap").terminate()
end)
vim.keymap.set("n", "<leader>dR", function()
	require("dap").clear_breakpoints()
end)
vim.keymap.set("n", "<leader>de", function()
	require("dap").set_exception_breakpoints({ "all" })
end)
vim.keymap.set("n", "<leader>di", function()
	require("dap.ui.widgets").hover()
end)
vim.keymap.set("n", "<leader>d?", function()
	local widgets = require("dap.ui.widgets")
	widgets.centered_float(widgets.scopes)
end)
vim.keymap.set("n", "<leader>dk", ':lua require"dap".up()<CR>zz')
vim.keymap.set("n", "<leader>dj", ':lua require"dap".down()<CR>zz')
vim.keymap.set("n", "<leader>dr", ':lua require"dap".repl.toggle({}, "vsplit")<CR><C-w>l')

-- nvim-telescope/telescope-dap.nvim
require("telescope").load_extension("dap")
vim.keymap.set("n", "<leader>ds", ":Telescope dap frames<CR>")
vim.keymap.set("n", "<leader>dc", ":Telescope dap commands<CR>")
vim.keymap.set("n", "<leader>db", ":Telescope dap list_breakpoints<CR>")
vim.keymap.set("n", "<leader>df", ":Telescope dap variables<CR>")

-- C/Rust/C++
dap.adapters.lldb = {
	type = "executable",
	command = "/usr/bin/lldb-vscode", -- adjust as needed, must be absolute path
	name = "lldb",
}

dap.configurations.cpp = {
	{
		name = "Launch",
		type = "lldb",
		request = "launch",
		program = function()
			return vim.fn.input("Path to executable: ", vim.fn.getcwd() .. "/", "file")
		end,
		cwd = "${workspaceFolder}",
		stopOnEntry = false,
		args = function()
			local argument_string = vim.fn.input("Program arguments: ")
			return vim.fn.split(argument_string, " ", true)
		end,
	},
}

-- If you want to use this for Rust and C, add something like this:

dap.configurations.c = dap.configurations.cpp
dap.configurations.rust = dap.configurations.cpp

require("nvim-dap-virtual-text").setup()

require("dapui").setup({
	icons = { expanded = "", collapsed = "", current_frame = "" },
	mappings = {
		-- Use a table to apply multiple mappings
		expand = { "<CR>", "<2-LeftMouse>" },
		open = "o",
		remove = "d",
		edit = "e",
		repl = "r",
		toggle = "t",
	},
	-- Use this to override mappings for specific elements
	element_mappings = {
		-- Example:
		-- stacks = {
		--   open = "<CR>",
		--   expand = "o",
		-- }
	},
	-- Expand lines larger than the window
	-- Requires >= 0.7
	expand_lines = vim.fn.has("nvim-0.7") == 1,
	-- Layouts define sections of the screen to place windows.
	-- The position can be "left", "right", "top" or "bottom".
	-- The size specifies the height/width depending on position. It can be an Int
	-- or a Float. Integer specifies height/width directly (i.e. 20 lines/columns) while
	-- Float value specifies percentage (i.e. 0.3 - 30% of available lines/columns)
	-- Elements are the elements shown in the layout (in order).
	-- Layouts are opened in order so that earlier layouts take priority in window sizing.
	layouts = {
		{
			elements = {
				-- Elements can be strings or table with id and size keys.
				{ id = "scopes", size = 0.25 },
				"breakpoints",
				"stacks",
				"watches",
			},
			size = 40, -- 40 columns
			position = "left",
		},
		{
			elements = {
				"repl",
				"console",
			},
			size = 0.25, -- 25% of total lines
			position = "bottom",
		},
	},
	controls = {
		-- Requires Neovim nightly (or 0.8 when released)
		enabled = true,
		-- Display controls in this element
		element = "repl",
		icons = {
			pause = "",
			play = "",
			step_into = "",
			step_over = "",
			step_out = "",
			step_back = "",
			run_last = "",
			terminate = "",
		},
	},
	floating = {
		max_height = nil, -- These can be integers or a float between 0 and 1.
		max_width = nil, -- Floats will be treated as percentage of your screen.
		border = "single", -- Border style. Can be "single", "double" or "rounded"
		mappings = {
			close = { "q", "<Esc>" },
		},
	},
	windows = { indent = 1 },
	render = {
		max_type_length = nil, -- Can be integer or nil.
		max_value_lines = 100, -- Can be integer or nil.
	},
})
