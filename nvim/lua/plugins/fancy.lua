return {
	--Colorscheme
	{
		"rose-pine/neovim",
		name = "rose-pine",
		opts = {
			dark_variant = "moon",
			disable_background = true,
			disable_float_background = true,

			groups = {
				border = "subtle",
				comment = "muted",
			},

			highlight_groups = {
				FloatBorder = { fg = "iris" },
				ColorColumn = { bg = "rose" },
				CursorLine = { bg = "foam", blend = 10 },
				StatusLine = { fg = "love", bg = "love", blend = 10 },
				Search = { bg = "gold", inherit = true },
				MiniIndentscopeSymbol = { fg = "pine" },
				MiniIndentscopeSymbolOff = { fg = "pine", bold = true },
				NeorgHeading1Prefix = { fg = "love" },
				NeorgHeading2Prefix = { fg = "iris" },
				NeorgHeading3Prefix = { fg = "pine" },
				NeorgHeading4Prefix = { fg = "gold" },
				NeorgHeading5Prefix = { fg = "foam" },
				NeorgHeading6Prefix = { fg = "rose" },
				CursorLineNr = { fg = "iris" },
			},
		},
	},

	--colorize
	{
		"norcalli/nvim-colorizer.lua",
		ft = { "css", "js", "html", "lua", "yml" },
		config = function()
			require("colorizer").setup({
				"lua",
				"css",
				"javascript",
				html = {
					mode = "foreground",
				},
			})
		end,
	},

	--mini-indentscope
	{
		"echasnovski/mini.indentscope",
		version = false,
		event = { "BufReadPre", "BufNewFile" },
		opts = {
			symbol = "│",
			options = { try_as_border = true },
		},
	},

	--Alpha
	{
		"goolord/alpha-nvim",
		event = "VimEnter",
		pin = true,
		config = function()
			require("alpha.themes.dashboard").section.footer.val = require("alpha.fortune")()
			require("alpha").setup(require("alpha.themes.startify").opts)
		end,
	},

	--scrollbar
	{
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
	},

	--smooth-scroll
	{
		"declancm/cinnamon.nvim",
		event = "CursorMoved",
		config = function()
			require("cinnamon").setup({
				-- KEYMAPS:
				default_keymaps = true, -- Create default keymaps.
				extra_keymaps = true, -- Create extra keymaps.
				extended_keymaps = true, -- Create extended keymaps.
				override_keymaps = false, -- The plugin keymaps will override any existing keymaps.

				-- OPTIONS:
				always_scroll = true, -- Scroll the cursor even when the window hasn't scrolled.
				centered = true, -- Keep cursor centered in window when using window scrolling.
				disabled = false, -- Disables the plugin.
				default_delay = 7, -- The default delay (in ms) between each line when scrolling.
				hide_cursor = false, -- Hide the cursor while scrolling. Requires enabling termguicolors!
				horizontal_scroll = true, -- Enable smooth horizontal scrolling when view shifts left or right.
				max_length = -1, -- Maximum length (in ms) of a command. The line delay will be
				-- re-calculated. Setting to -1 will disable this option.
				scroll_limit = 150, -- Max number of lines moved before scrolling is skipped. Setting
				-- to -1 will disable this option.
			})
		end,
	},

	--fold
	{
		"milisims/foldhue.nvim",
		event = "VeryLazy",
		config = function()
			require("foldhue").enable()
		end,
	},

	--illuminate
	{
		"RRethy/vim-illuminate",
		event = { "BufReadPre", "BufNewFile" },
		config = function()
			require("illuminate").configure({
				providers = {
					"lsp",
					"treesitter",
				},
				iletypes_denylist = {
					"TelescopePrompt",
					"TelescopeResults",
				},
				min_count_to_highlight = 2,
				delay = 100,
			})
		end,
	},
}
