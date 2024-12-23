return {
	"Exafunction/codeium.nvim",
	event = "BufEnter",
	dependencies = {
		"nvim-lua/plenary.nvim",
		"hrsh7th/nvim-cmp",
	},
	config = function()
		require("codeium").setup({
			virtual_text = {
				enabled = true,
				idle_delay = 25,
				key_bindings = {
					accept = "<C-f>",
					accept_word = "<C-s>",
					accept_line = "<C-l>",
					clear = false,
					next = "<C-j>",
					prev = "<C-k>",
				},
			},
		})
	end,
}
