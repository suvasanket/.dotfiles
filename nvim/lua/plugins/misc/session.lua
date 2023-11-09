return {
	"folke/persistence.nvim",
	event = "BufReadPre",
	keys = {
		{ "<leader>qs", [[<cmd>lua require("persistence").load()<cr>]], desc = "session on this dir" },
		{ "<leader>ql", [[<cmd>lua require("persistence").load({ last = true })<cr>]], desc = "last session" },
		{ "<leader>qd", [[<cmd>lua require("persistence").stop()<cr>]], desc = "stop session record" },
	},
	opts = {
		dir = vim.fn.expand(vim.fn.stdpath("state") .. "/sessions/"), -- directory where session files are saved
		options = { "buffers", "curdir", "tabpages", "winsize" }, -- sessionoptions used for saving
		pre_save = nil, -- a function to call before saving the session
		save_empty = false, -- don't save if there are no open file buffers
	},
}
