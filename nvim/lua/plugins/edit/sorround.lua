return {
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
			normal = "s",
			normal_cur = "ss",
			normal_line = "S",
			normal_cur_line = "SS",
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
}
