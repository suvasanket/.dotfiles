return {
	{
		"nvim-neorg/neorg",
		ft = "norg",
		cmd = { "Neorg" },
		keys = {
			{ "<leader>nn", "<cmd>Neorg index<cr>", desc = { "New note" } },
			{ "<leader>nq", "<cmd>Neorg return<cr>", desc = { "Quit note" } },
		},
		build = ":Neorg sync-parsers",
		opts = {
			load = {
				["core.defaults"] = {},
				["core.autocommands"] = {},
				["core.neorgcmd"] = {},
				["core.mode"] = {},
				["core.keybinds"] = {},
				["core.integrations.nvim-cmp"] = {},
				["core.integrations.treesitter"] = {},
				["core.concealer"] = {
					config = {
						icon_preset = "varied",
						icons = {
							code_block = {
								conceal = true,
								padding = {
									left = 10,
								},
							},
						},
					},
				},
				["core.dirman"] = { -- Manages Neorg workspaces
					config = {
						workspaces = {
							notes = "~/neorg/notes",
							study = "~/neorg/study",
						},
						default_workspace = "notes",
					},
				},
			},
		},
	},
}
