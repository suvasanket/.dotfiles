return {
	"ojroques/nvim-bufdel",
	keys = {
		{ "zx", "<cmd>BufDel!<cr>", desc = "buffer delete" },
		{ "zX", "<cmd>BufDelOthers!<cr>", desc = "buffer delete others" },
	},
	opts = {
		next = "tabs",
		quit = true, -- quit Neovim when last buffer is closed
	},
}
