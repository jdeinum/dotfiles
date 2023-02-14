-------------------------TELESCOPE---------------------------------------------
local telescope
status_ok, telescope = pcall(require, "telescope")
if not status_ok then
	print("Error: Can't find Telescope!")
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

telescope.setup({
	pickers = {
		buffers = fixfolds,
		find_files = fixfolds,
		git_files = fixfolds,
		grep_string = fixfolds,
		live_grep = fixfolds,
		oldfiles = fixfolds,
	},
	file_ignore_patterns = { "node_modules", ".git" },
})

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
	local utils = require("telescope.utils")
	local builtin = require("telescope.builtin")
	local _, ret, _ = utils.get_os_command_output({ "git", "rev-parse", "--is-inside-work-tree" })
	if ret == 0 then
		builtin.git_files()
	else
		builtin.find_files()
	end
end

_G.telescope_fuzzy_git = function()
	require("telescope.builtin").live_grep({
		cwd = vim.fn.systemlist("git rev-parse --show-toplevel")[1],
	})
end

require("telescope").load_extension("fzf")

vim.keymap.set("n", "<leader>fq", function()
	telescope_live_grep_in_path()
end)
vim.keymap.set("n", "<leader>fw", function()
	telescope_files_or_git_files()
end)
vim.keymap.set("n", "<leader>fe", function()
	telescope_find_files_in_path()
end)

vim.keymap.set("n", "<leader>fr", function()
	telescope_fuzzy_git()
end)

local opts = {silent = true}

vim.keymap.set("n", "<leader>ft", ":Telescope current_buffer_fuzzy_find<CR>", opts)
vim.keymap.set("n", "<leader>fn", ":Telescope git_files<CR>", opts)
vim.keymap.set("n", "<leader>fm", ":Telescope find_files<CR>", opts)
vim.keymap.set("n", "<leader>fg", ":Telescope treesitter<CR>", opts)
vim.keymap.set("n", "<leader>;", ":Telescope buffers<CR>", opts)
vim.keymap.set("n", "<leader>fp", ":Telescope grep_string<CR>", opts)
vim.keymap.set("n", "<leader>ff", ":Telescope live_grep<CR>", opts)
vim.keymap.set("n", "<c-p>", ":Telescope commands<CR>", opts)

