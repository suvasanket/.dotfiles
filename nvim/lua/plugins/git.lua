return {
	--gitsigns
	{
		"lewis6991/gitsigns.nvim",
		event = { "BufReadPre", "BufNewFile" },
		keys = {
			{ "<leader>g0", "<cmd>Gitsigns reset_buffer<cr>", desc = "git reset buffer" },
			{ "<leader>ga", "<cmd>Gitsigns toggle_current_line_blame<cr>", desc = "git blame" },
			{ "<leader>gs", "<cmd>Gitsigns stage_hunk<cr>", mode = { "v", "i" }, desc = "git stage hunk" },
		},
		opts = {
			signcolumn = true,
			numhl = false,
			linehl = false,
		},
	},

	--fugitive
	{
		"tpope/vim-fugitive",
		dependencies = "tpope/vim-rhubarb",
		event = "VeryLazy",
	},

	--git diff
	{
		"sindrets/diffview.nvim",
		keys = {
			{ "<leader>gd", "<cmd>DiffviewOpen<cr>", desc = "git diff/hist" },
			{ "<leader>gq", "<cmd>DiffviewClose<cr>", desc = "git diff/hist close" },
		},
	},
}
