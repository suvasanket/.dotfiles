return {
	"akinsho/bufferline.nvim",
	event = "VeryLazy",
	keys = {
		{ "zn", "<cmd>BufferLineCycleNext<cr>" },
		{ "zp", "<cmd>BufferLineCyclePrev<cr>" },
	},
	opts = {
		options = {
			indicator = {
				icon = "▊", -- this should be omitted if indicator style is not 'icon'
			},
			always_show_bufferline = true,
			show_buffer_close_icons = false,
			themable = true,
			diagnostics = "nvim_lsp",
			offsets = {
				{
					filetype = "DiffviewFiles",
					text = "DiffviewFiles",
					text_align = "left",
					highlight = "Label",
					separator = true,
				},
				{
					filetype = "neo-tree",
					text = "",
					text_align = "center",
					highlight = "Directory",
					separator = true,
				},
				{
					filetype = "undotree",
					text = "Undotree",
					text_align = "left",
					highlight = "Label",
					separator = true,
				},
			},
		},
		highlights = {
			indicator_selected = {
				fg = "#C3EDC0",
			},
		},
	},
}
