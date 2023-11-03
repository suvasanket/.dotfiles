return {
	"ojroques/nvim-bufdel",
	pin = true,
	keys = {
		{ "<D-w>", "<cmd>BufDel!<cr>", desc = "buffer delete" },
		{ "zX", "<cmd>BufDelOthers!<cr>", desc = "buffer delete others" },
	},
	opts = {
		next = "tabs",
		quit = false, -- quit Neovim when last buffer is closed
	},
}
