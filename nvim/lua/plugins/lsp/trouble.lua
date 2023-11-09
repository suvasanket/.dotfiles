return {
	"folke/trouble.nvim",
	event = "LspAttach",
	dependencies = {
		"kosayoda/nvim-lightbulb",
		opts = {
			autocmd = {
				enabled = true,
				updatetime = 300,
			},
			float = { enabled = true },
		},
	},
	opts = {
		-- your configuration comes here
		-- or leave it empty to use the default settings
		-- refer to the configuration section below
	},
}
