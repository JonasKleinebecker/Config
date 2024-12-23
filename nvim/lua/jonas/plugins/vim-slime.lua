-- Function to check and run python in tmux
_G.CheckAndRunPython = function()
	-- Replace with the full path to your check_and_run_python.sh script
	local script_path = "~/scripts/check_and_run_python.sh"

	-- Execute the script and capture the output
	local handle = io.popen(script_path)
	local output = handle:read("*a")
	handle:close()

	-- Split the output into lines
	local lines = {}
	for line in output:gmatch("[^\r\n]+") do
		table.insert(lines, line)
	end

	-- Execute each line in the output
	for _, line in ipairs(lines) do
		if line:match("^let g:slime_default_config") then
			vim.cmd(line)
		end
	end
end

return {
	-- slime (REPL integration)
	{
		"jpalardy/vim-slime",
		config = function()
			vim.g.slime_target = "tmux"
			vim.g.slime_cell_delimiter = "# %%"
			vim.g.slime_bracketed_paste = 1
			-- init.lua configuration for vim-slime
			vim.g.slime_target = "tmux"
			vim.g.slime_python_ipython = 0
			vim.g.slime_dont_ask_default = 1

			-- Create a keybinding for the function
			vim.api.nvim_set_keymap(
				"n",
				"<leader>rp",
				":lua CheckAndRunPython()<CR><Plug>SlimeLineSend<CR>",
				{ silent = false }
			)
			vim.api.nvim_set_keymap(
				"v",
				"<leader>rp",
				":lua CheckAndRunPython()<CR><Plug>SlimeRegionSend<CR>",
				{ silent = false }
			)
		end,
	},
}
