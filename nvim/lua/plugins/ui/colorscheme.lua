return {
	"rose-pine/neovim",
	name = "rose-pine",
	dependencies = {
		"levouh/tint.nvim",
		opts = {},
	},
	opts = {
		dark_variant = "moon",
		disable_background = true,
		disable_float_background = true,

		groups = {
			border = "subtle",
			comment = "muted",
		},

		highlight_groups = {
			TelescopeBorder = { fg = "subtle", bold = true },
			PmenuSel = { fg = "pine", bg = "muted", blend = 3, bold = true },
			FloatBorder = { fg = "iris" },
			ColorColumn = { bg = "rose" },
			CursorLine = { bg = "foam", blend = 10 },
			StatusLine = { fg = "love", bg = "NONE", blend = 10 },
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
			CmpItemMenu = { fg = "subtle", italic = true },
			CmpItemAbbr = { fg = "text" },
			CmpItemAbbrMatch = { fg = "foam" },
			CmpItemAbbrMatchFuzzy = { fg = "foam" },
			CmpItemKindVariable = { fg = "iris" },
			GitSignsAdd = { bg = "none" },
			GitSignsChange = { bg = "none" },
			GitSignsDelete = { bg = "none" },
		},
	},
}
