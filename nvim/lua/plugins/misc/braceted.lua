return {
	"echasnovski/mini.bracketed",
	event = "BufNew",
	config = function()
		require("mini.bracketed").setup({
			diagnostic = { suffix = "", options = {} },
			file = { suffix = "", options = {} },
		})
	end,
}
