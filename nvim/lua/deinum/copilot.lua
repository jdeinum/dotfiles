local vim = vim
local api = vim.api

-- first we disable copilot
vim.api.nvim_command('let g:copilot_enabled = 0')

local function toggle_copilot()
	local state = api.nvim_command_output("echo g:copilot#Enabled()")
	if state == "0" then
    print("Enabling Copilot")
		api.nvim_command("Copilot enable")
	else
    print("Disabling Copilot")
		api.nvim_command("Copilot disable")
	end
end

vim.keymap.set("n", "<leader>k", toggle_copilot)
