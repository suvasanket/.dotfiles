return {
	"echasnovski/mini.animate",
	event = "VeryLazy",
	enabled = true,
	config = function()
		require("mini.animate").setup({
			resize = { enable = true },
			open = { enable = false },
			close = { enable = false },
		})
	end,
}
