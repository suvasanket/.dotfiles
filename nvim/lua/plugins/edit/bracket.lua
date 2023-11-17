return {
	{
		"windwp/nvim-autopairs",
		event = { "InsertEnter" },
		opts = {
			map_cr = true,
			map_bs = true,
		},
	},
	{
		"windwp/nvim-ts-autotag",
		ft = { "html", "css" },
	},
	{
		"kylechui/nvim-surround",
		version = "*",
		keys = {
			{ "ys", mode = { "n", "v" } },
			{ "yS", mode = { "v", "x" } },
			{ "ds", mode = { "n" } },
			{ "cs", mode = { "n" } },
		},
		opts = {
			keymaps = {
				normal = "ys",
				normal_cur = "yss",
				normal_line = "yS",
				normal_cur_line = "ySS",
				viual = "<C-g>s",
				visual_line = "<C-g>s",
				delete = "ds",
				change = "cs",
			},
			aliases = {
				["<"] = ">",
				["b"] = { ")", "]", "}" },
				["q"] = { '"', "'", "`" },
				["s"] = { "}", "]", ")", ">", '"', "'", "`" },
			},
		},
	},
}