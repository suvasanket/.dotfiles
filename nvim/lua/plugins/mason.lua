return {
	--Mason
	{
		"williamboman/mason.nvim",
		event = { "BufReadPre", "BufNewFile" },
		cmd = { "Mason" },
		opts = {
			ui = {
				border = { "╭", "─", "╮", "│", "╯", "─", "╰", "│" },
			},
		},
	},

	-- dap-mason
	{
		"jay-babu/mason-nvim-dap.nvim",
		event = { "BufReadPre" },
		opts = {
			automatic_setup = true,
			handlers = {
				function(config)
					require("mason-nvim-dap").default_setup(config)
				end,
			},
		},
	},
}
