return {
	--Colorscheme
	{
		"rose-pine/neovim",
		name = "rose-pine",
		opts = {
			--- @usage 'auto'|'main'|'moon'|'dawn'
			variant = "auto",
			--- @usage 'main'|'moon'|'dawn'
			dark_variant = "moon",
			bold_vert_split = false,
			dim_nc_background = false,
			disable_background = true,
			disable_float_background = true,
			disable_italics = false,

			--- @usage string hex value or named color from rosepinetheme.com/palette
			groups = {
				background = "base",
				background_nc = "_experimental_nc",
				panel = "surface",
				panel_nc = "base",
				border = "highlight_med",
				comment = "muted",
				link = "iris",
				punctuation = "subtle",

				error = "love",
				hint = "iris",
				info = "foam",
				warn = "gold",

				headings = {
					h1 = "iris",
					h2 = "foam",
					h3 = "rose",
					h4 = "gold",
					h5 = "pine",
					h6 = "foam",
				},
				-- or set all headings at once
				-- headings = 'subtle'
			},

			-- Change specific vim highlight groups
			-- https://github.com/rose-pine/neovim/wiki/Recipes
			highlight_groups = {
				FloatBorder = { fg = "rose" },
				ColorColumn = { bg = "rose" },

				-- Blend colours against the "base" background
				CursorLine = { bg = "foam", blend = 10 },
				StatusLine = { fg = "love", bg = "love", blend = 10 },

				-- By default each group adds to the existing config.
				-- If you only want to set what is written in this config exactly,
				-- you can set the inherit option:
				Search = { bg = "gold", inherit = true },
			},
		},
	},

	--colorize
	{
		"norcalli/nvim-colorizer.lua",
		ft = { "css", "js", "html", "lua" },
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
}
