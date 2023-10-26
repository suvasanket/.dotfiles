return {
	--gitsigns
	{
		"lewis6991/gitsigns.nvim",
		event = { "BufReadPre", "BufNewFile" },
		keys = {
			{ "<leader>gs", "<cmd>Git stage_buffer<cr>", desc = "git stage buffer" },
			{ "<leader>gs", "<cmd>Gitsigns stage_hunk<cr>", mode = { "v" }, desc = "git stage hunk" },
			{ "<leader>g0", "<cmd>Git reset_buffer<cr>", desc = "git reset buffer" },
			{ "<leader>ga", "<cmd>Git toggle_current_line_blame<cr>", desc = "git blame" },
		},
		opts = {
			signcolumn = true,
			numhl = false,
			linehl = false,
		},
	},

	--fugitive
	{ "tpope/vim-fugitive", cmd = { "G" }, enabled = true },
}
