return {
	"petertriho/nvim-scrollbar",
	event = "BufRead",
	opts = {
		excluded_buftypes = {
			"terminal",
			"Alpha",
		},
		excluded_filetypes = {
			"prompt",
			"TelescopePrompt",
			"alpha",
			"NvimTree",
		},
		handlers = {
			cursor = false,
			diagnostic = true,
			gitsigns = false,
			handle = true,
			search = false,
			ale = true,
		},
	},
}
