return {
	"folke/trouble.nvim",
	event = "LspAttach",
	dependencies = {
		"kosayoda/nvim-lightbulb",
		opts = {
			autocmd = {
				enabled = true,
				updatetime = 700,
			},
			float = { enabled = true },
		},
	},
	keys = {
		{ "<leader>qf", "<cmd>TroubleToggle quickfix<cr>", desc = "quickfix" },
	},
	opts = {
		-- severity = vim.diagnostic.severity.ERROR, -- nil (ALL) or vim.diagnostic.severity.ERROR | WARN | INFO | HINT
		padding = false, -- add an extra new line on top of the list
		auto_close = true,
		indent_lines = false, -- add an indent guide below the fold icons
		signs = {
			error = "",
			warning = "",
			hint = "",
			information = "",
			other = "",
		},
		action_keys = {
			open_split = { "<c-s>" },
		},
	},
}
