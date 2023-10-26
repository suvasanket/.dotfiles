return {
	{
		"nvim-neorg/neorg",
		ft = "norg",
		keys = {
			{ "<leader>ni", "<cmd>Neorg index<cr>", desc = { "New note" } },
			{ "<leader>nn", "<cmd>Neorg<cr>", desc = { "Neorg Menu" } },
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
				["core.completion"] = {
					config = {
						engine = "nvim-cmp",
					},
				},
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
							ordered = {
								icons = { "1", "A", "a", "⑴", "Ⓐ", "ⓐ" },
							},
						},
					},
				},
				["core.dirman"] = {
					config = {
						workspaces = {
							notes = "~/neorg/notes",
							study = "~/neorg/study",
						},
						default_workspace = "notes",
					},
				},
				["core.highlights"] = {
					config = {
						highlights = {
							headings = {
								[1] = { prefix = "+NeorgHeading1Prefix", title = "+NeorgHeading1Prefix" },
								[2] = { prefix = "+NeorgHeading2Prefix", title = "+NeorgHeading2Prefix" },
								[3] = { prefix = "+NeorgHeading3Prefix", title = "+NeorgHeading3Prefix" },
								[4] = { prefix = "+NeorgHeading4Prefix", title = "+NeorgHeading4Prefix" },
								[5] = { prefix = "+NeorgHeading5Prefix", title = "+NeorgHeading5Prefix" },
								[6] = { prefix = "+NeorgHeading6Prefix", title = "+NeorgHeading6Prefix" },
							},
						},
					},
				},
			},
		},
	},
}
