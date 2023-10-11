return {
	"nmac427/guess-indent.nvim",
	events = { "BufReadPre" },
	config = function()
		require("guess-indent").setup({})
	end,
}
