return {
	"stevearc/conform.nvim",
	event = { "BufWritePre" },
	keys = {
		{
			"<C-cr>",
			function()
				require("conform").format()
			end,
			mode = { "n", "i" },
			desc = "format",
		},
	},
	opts = {
		formatters_by_ft = {
			["*"] = { "codespell" },
			lua = { "stylua" },
			javascript = { "prettier" },
			html = { "prettier" },
			css = { "prettier" },
			c = { "clang_format" },
			java = { "clang_format" },
			zsh = { "beautysh" },
		},
		-- format_on_save = {
		-- 	timeout_ms = 500,
		-- 	lsp_fallback = true,
		-- },
	},
}
