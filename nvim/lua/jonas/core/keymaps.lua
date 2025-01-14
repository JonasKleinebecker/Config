vim.g.mapleader = " "

local keymap = vim.keymap -- for conciseness

keymap.set("i", "jk", "<ESC>", { desc = "Exit insert mode with jk" })

keymap.set("n", "<leader>nh", ":nohl<CR>", { desc = "Clear search highlights" })

-- increment/decrement numbers
keymap.set("n", "<leader>+", "<C-a>", { desc = "Increment number" }) -- increment
keymap.set("n", "<leader>-", "<C-x>", { desc = "Decrement number" }) -- decrement

-- window management
keymap.set("n", "<leader>sv", "<C-w>v", { desc = "Split window vertically" }) -- split window vertically
keymap.set("n", "<leader>sh", "<C-w>s", { desc = "Split window horizontally" }) -- split window horizontally
keymap.set("n", "<leader>se", "<C-w>=", { desc = "Make splits equal size" }) -- make split windows equal width & height
keymap.set("n", "<leader>sx", "<cmd>close<CR>", { desc = "Close current split" }) -- close current split window

keymap.set("n", "<leader>tx", "<cmd>bd<CR>", { desc = "Close current Buffer" })
keymap.set("n", "<leader>tn", "<cmd>bn<CR>", { desc = "Go to next Buffer" })
keymap.set("n", "<leader>tp", "<cmd>bp<CR>", { desc = "Go to previous Buffer" })
keymap.set("n", "<leader>tf", "<cmd>new<CR>", { desc = "Create new Buffer" })
keymap.set("n", "<leader>to", function()
	local current_buf = vim.fn.bufnr("%")
	for _, buf in ipairs(vim.api.nvim_list_bufs()) do
		if buf ~= current_buf then
			vim.api.nvim_buf_delete(buf, { force = true })
		end
	end
end, { desc = "Close all Buffers but current" })
