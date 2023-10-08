return {
	--noice
	{
		"folke/noice.nvim",
		event = "VeryLazy",
		keys = {
			{ ":" },
			{ "<leader>ms", "<cmd>Noice<cr>", desc = "messages" },
		},
		opts = {
			cmdline = {
				enabled = true,
				view = "cmdline", --cmdline/cmdline_popup
				format = {
					cmdline = { pattern = "^:", icon = "", lang = "vim", title = "" },
					search_down = { kind = "search", pattern = "^/", icon = " ", lang = "regex" },
					search_up = { kind = "search", pattern = "^%?", icon = " ", lang = "regex" },
					input = { pattern = "'<,'>s/", icon = "󰬲", title = "" },
				},
			},
			lsp = {
				hover = { enabled = false },
				progress = {
					enabled = true,
					view = "mini",
				},
			},
			messages = {
				view_search = false,
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
			timeout = 5000,
			max_height = function()
				return math.floor(vim.o.lines * 0.75)
			end,
			max_width = function()
				return math.floor(vim.o.columns * 0.45)
			end,
			-- minimum_width = 30,
			render = "wrapped-compact",
			stages = "fade_in_slide_out",
			top_down = false,
			icons = {
				DEBUG = "",
				ERROR = "",
				INFO = "",
				TRACE = "✎",
				WARN = "",
			},
		},
	},
	--nui
	{ "MunifTanjim/nui.nvim", lazy = true },

	--dressing
	{
		"stevearc/dressing.nvim",
		lazy = true,
		init = function()
			---@diagnostic disable-next-line: duplicate-set-field
			vim.ui.select = function(...)
				require("lazy").load({ plugins = { "dressing.nvim" } })
				return vim.ui.select(...)
			end
			---@diagnostic disable-next-line: duplicate-set-field
			vim.ui.input = function(...)
				require("lazy").load({ plugins = { "dressing.nvim" } })
				return vim.ui.input(...)
			end
		end,
		opts = {
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
}
