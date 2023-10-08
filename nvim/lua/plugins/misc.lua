return {
	--mini-bracketed
	{
		"echasnovski/mini.bracketed",
		event = "BufNew",
		config = function()
			require("mini.bracketed").setup({
				diagnostic = { suffix = "", options = {} },
				file = { suffix = "", options = {} },
			})
		end,
	},

	--Tmux-splits
	{
		"mrjones2014/smart-splits.nvim",
		build = "./kitty/install-kittens.bash",
		enabled = true,
		--stylua: ignore
		keys = {
			{ "<M-h>", function() require("smart-splits").resize_left() end },
			{ "<M-j>", function() require("smart-splits").resize_down() end },
			{ "<M-k>", function() require("smart-splits").resize_up() end },
			{ "<M-l>", function() require("smart-splits").resize_right() end },
			-- moving between splits
			{ "<C-h>", function() require("smart-splits").move_cursor_left() end },
			{ "<C-j>", function() require("smart-splits").move_cursor_down() end },
			{ "<C-k>", function() require("smart-splits").move_cursor_up() end },
			{ "<C-l>", function() require("smart-splits").move_cursor_right() end },
			-- swapping buffers between windows
			{ "<leader><leader>h", function() require("smart-splits").swap_buf_left() end, desc = "swapLeft" },
			{ "<leader><leader>j", function() require("smart-splits").swap_buf_down() end, desc = "swapDown" },
			{ "<leader><leader>k", function() require("smart-splits").swap_buf_up() end, desc = "swapUp" },
			{ "<leader><leader>l", function() require("smart-splits").swap_buf_right() end, desc = "swapRight" },
		},
		opts = {},
	},

	--guess-indent
	{
		"nmac427/guess-indent.nvim",
		events = { "BufReadPre" },
		config = function()
			require("guess-indent").setup({})
		end,
	},

	--session
	{
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
	},
}
