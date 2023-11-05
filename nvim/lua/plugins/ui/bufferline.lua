return {
	"akinsho/bufferline.nvim",
	event = "VeryLazy",
	opts = {
		options = {
			always_show_bufferline = true,
			show_buffer_close_icons = false,
			themable = true,
			diagnostics = "nvim_lsp",
			offsets = {
				{
					filetype = "OverseerList",
					text = "Overseer",
					text_align = "center",
					highlight = "Label",
					separator = true,
				},
				{
					filetype = "NvimTree",
					text = "NvimTree",
					text_align = "left",
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
