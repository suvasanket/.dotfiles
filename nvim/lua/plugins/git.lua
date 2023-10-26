return {
	--neogit
	{
		"NeogitOrg/neogit",
		dependencies = {
			"nvim-lua/plenary.nvim",
			"nvim-telescope/telescope.nvim",
			"sindrets/diffview.nvim",
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
	{ "tpope/vim-fugitive", cmd = { "G" }, enabled = false },
}
