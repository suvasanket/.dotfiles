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
				-- Reverting/Cherry Picking
				sequencer = {
					folded = true,
				},
				untracked = {
					folded = true,
				},
				unstaged = {
					folded = true,
				},
				staged = {
					folded = true,
				},
				stashes = {
					folded = true,
				},
				unpulled_upstream = {
					folded = true,
				},
				unmerged_upstream = {
					folded = true,
				},
				unpulled_pushRemote = {
					folded = true,
				},
				unmerged_pushRemote = {
					folded = true,
				},
				recent = {
					folded = true,
				},
				rebase = {
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
}
