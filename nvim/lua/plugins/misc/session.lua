return {
	"folke/persistence.nvim",
	event = "BufReadPre",
	keys = {
		{ "<leader>qs", '<cmd>lua require("persistence").load()<cr>', desc = "curdir session" },
		{ "<leader>ql", '<cmd>lua require("persistence").load({ last = true })<cr>', desc = "last session" },
		{ "<leader>qd", '<cmd>lua require("persistence").stop()<cr>', desc = "stop session" },
	},
	opts = {
		dir = vim.fn.expand(vim.fn.stdpath("state") .. "/sessions/"), -- directory where session files are saved
		options = { "buffers", "curdir", "tabpages", "winsize" }, -- sessionoptions used for saving
		pre_save = nil,
	},
}
