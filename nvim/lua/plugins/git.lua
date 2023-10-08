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
			{ "<leader>g", "<cmd>Neogit cwd=%:p:h<cr>", desc = "Neogit" },
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
		opts = {
			signs = {
				add = { hl = "GitSignsAdd", text = " │", numhl = "GitSignsAddNr", linehl = "GitSignsAddLn" },
				change = {
					hl = "GitSignsChange",
					text = " │",
					numhl = "GitSignsChangeNr",
					linehl = "GitSignsChangeLn",
				},
				delete = { hl = "GitSignsDelete", text = "_", numhl = "GitSignsDeleteNr", linehl = "GitSignsDeleteLn" },
				topdelete = {
					hl = "GitSignsDelete",
					text = "-",
					numhl = "GitSignsDeleteNr",
					linehl = "GitSignsDeleteLn",
				},
				changedelete = {
					hl = "GitSignsChange",
					text = "~",
					numhl = "GitSignsChangeNr",
					linehl = "GitSignsChangeLn",
				},
				untracked = { hl = "GitSignsAdd", text = "", numhl = "GitSignsAddNr", linehl = "GitSignsAddLn" },
			},
		},
	},
}
