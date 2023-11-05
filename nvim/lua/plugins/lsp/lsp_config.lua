return {
	--lsp-config
	{
		"neovim/nvim-lspconfig",
		event = { "BufReadPre", "BufNewFile" },
		config = function()
			require("lspconfig.ui.windows").default_options.border =
				{ "╭", "─", "╮", "│", "╯", "─", "╰", "│" }
		end,
	},

	--jdtls
	{ "mfussenegger/nvim-jdtls", ft = { "java", "xml" } },

	--lsptimeout
	{ "hinell/lsp-timeout.nvim", event = "LspAttach" },
}
