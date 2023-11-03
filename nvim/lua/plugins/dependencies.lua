return {
	--lua plugins that are other to use
	{ "nvim-lua/plenary.nvim", event = "VeryLazy" },

	--web devicons
	{
		"nvim-tree/nvim-web-devicons",
		event = "VimEnter",
		opts = {
			override_by_extension = { ["norg"] = { icon = "󰂺", color = "#A2678A", name = "Norg" } },
		},
	},

	--nui
	{ "MunifTanjim/nui.nvim", event = "VeryLazy" },

	--dressing
	{
		"stevearc/dressing.nvim",
		event = "VeryLazy",
		opts = {
			input = {
				mappings = {
					n = {
						["<Esc>"] = "Close",
						["<CR>"] = "Confirm",
					},
					i = {
						["<C-c>"] = "Close",
						["<CR>"] = "Confirm",
						["<C-p>"] = "HistoryPrev",
						["<C-n>"] = "HistoryNext",
					},
				},
			},
			select = {
				get_config = function(opts)
					if opts.kind == "codeaction" then
						return {
							telescope = require("telescope.themes").get_cursor(),
						}
					end
				end,
			},
		},
	},

	--sql lite
	{ "kkharji/sqlite.lua", event = "VeryLazy" },
}
