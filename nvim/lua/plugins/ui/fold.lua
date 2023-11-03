return {
	"milisims/foldhue.nvim",
	event = "VeryLazy",
	config = function()
		require("foldhue").enable()
	end,
}
