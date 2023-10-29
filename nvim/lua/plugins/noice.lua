return {
	--noice
	{
		"folke/noice.nvim",
		event = "VeryLazy",
		keys = {
			{ ":" },
		},
		opts = {
			views = {
				mini = {
					win_options = {
						winblend = 0,
					},
				},
			},
			cmdline = {
				enabled = true,
				view = "cmdline", --cmdline/cmdline_popup
				format = {
					cmdline = { pattern = "^:", icon = "", lang = "vim", title = "" },
					search_down = { kind = "search", pattern = "^/", icon = " ", lang = "regex" },
					search_up = { kind = "search", pattern = "^%?", icon = " ", lang = "regex" },
					input = { pattern = "'<,'>s/", icon = "󰬲", title = "" },
				},
			},
			lsp = {
				override = {
					["vim.lsp.util.convert_input_to_markdown_lines"] = true,
					["vim.lsp.util.stylize_markdown"] = true,
					["cmp.entry.get_documentation"] = true,
				},
			},
			messages = {
				view_search = "virtualtext",
			},
			presets = {
				bottom_search = false,
				command_palette = false,
				long_message_to_split = true,
				lsp_doc_border = true,
			},
		},
	},

	--nvim-notify
	{
		"rcarriga/nvim-notify",
		event = "VeryLazy",
		opts = {
			fps = 50,
			background_colour = "#182912",
			timeout = 4000,
			max_height = function()
				return math.floor(vim.o.lines * 0.75)
			end,
			max_width = function()
				return math.floor(vim.o.columns * 0.45)
			end,
			-- minimum_width = 30,
			render = "wrapped-compact",
			stages = "fade_in_slide_out",
			top_down = true,
			icons = {
				DEBUG = " ",
				ERROR = "󱙝 ",
				INFO = " ",
				TRACE = " ",
				WARN = "",
			},
		},
	},
}
