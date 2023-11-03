return {
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
}
