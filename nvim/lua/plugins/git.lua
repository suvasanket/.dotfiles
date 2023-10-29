return {
	--neogit
	{
		"NeogitOrg/neogit",
		dependencies = {
			"nvim-lua/plenary.nvim",
			"nvim-telescope/telescope.nvim",
			{
				"sindrets/diffview.nvim",
				keys = {
					{ "<leader>gd", "<cmd>DiffviewOpen<cr>", desc = "git diff/hist" },
					{ "<leader>gq", "<cmd>DiffviewClose<cr>", desc = "git diff/hist close" },
				},
			},
		},
		keys = {
			{ "<leader>gg", "<cmd>Neogit cwd=%:p:h<cr>", desc = "Neogit" },
		},
		opts = {
			disable_hint = true,
			signs = {
				hunk = { " ", " " },
				item = { " ", " " },
				section = { " ", " " },
			},
			sections = {
				untracked = {
					folded = true,
				},
				unstaged = {
					folded = true,
				},
				staged = {
					folded = true,
				},
			},
		},
	},

	--gitsigns
	{
		"lewis6991/gitsigns.nvim",
		event = { "BufReadPre", "BufNewFile" },
		keys = {
			{ "<leader>g0", "<cmd>Gitsigns reset_buffer<cr>", desc = "git reset buffer" },
			{ "<leader>ga", "<cmd>Gitsigns toggle_current_line_blame<cr>", desc = "git blame" },
			{ "<leader>gs", "<cmd>Gitsigns stage_hunk<cr>", mode = { "v", "n" }, desc = "git stage hunk" },
		},
		opts = {
			signs = {
				add = { text = " ▍" },
				change = { text = " ▍" },
				delete = { text = "▁" },
				topdelete = { text = "🭶" },
				changedelete = { text = "~" },
				untracked = { text = " ⎸" },
			},
			signcolumn = true,
			numhl = false,
			linehl = false,
		},
	},

	--fugitive
	{
		"tpope/vim-fugitive",
		dependencies = "tpope/vim-rhubarb",
		event = "CmdlineEnter",
	},
}
