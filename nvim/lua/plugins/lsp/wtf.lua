return {
	"piersolenski/wtf.nvim",
	opts = {
		popup_type = "horizontal",
		openai_api_key = "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",
	},
	keys = {
		{
			"<leader>cH",
			mode = { "n", "x" },
			function()
				require("wtf").ai()
			end,
			desc = "Debug diagnostic with AI",
		},
		{
			mode = { "n" },
			"<leader>ch",
			function()
				require("wtf").search()
			end,
			desc = "Search diagnostic with Google",
		},
	},
}
