return {
	--mini-operate
	{
		"echasnovski/mini.operators",
		event = "BufReadPre",
		opts = {
			exchange = {
				prefix = "ge",
				reindent_linewise = true,
			},
		},
	},

	--autopairs
	{
		"windwp/nvim-autopairs",
		event = { "InsertEnter" },
		opts = {
			map_cr = true,
			map_bs = true,
		},
	},

	-- autotag
	{
		"windwp/nvim-ts-autotag",
		ft = { "html", "css" },
	},

	--Treesj-Split join
	{
		"Wansmer/treesj",
		keys = { { "J", "<cmd>TSJToggle<cr>", desc = "Split/Join" } },
		opts = {
			max_join_length = 220,
			notify = false,
		},
	},

	--Comment
	{
		"numToStr/Comment.nvim",
		event = { "BufReadPost", "BufNewFile" },
		dependencies = {
			"JoosepAlviste/nvim-ts-context-commentstring",
			lazy = true,
		},
		opts = {
			pre_hook = function()
				require("ts_context_commentstring.internal").update_commentstring({})
			end,
		},
		config = function(_, opts)
			require("Comment").setup(opts)
		end,
	},

	--nvim-recorder
	{
		"chrisgrieser/nvim-recorder",
		keys = {
			{ "Q", desc = "recorder" },
			{ "q", desc = "play" },
			{ "<leader>qc", desc = "change macro" },
			{ "<leader>qe", desc = "modify macro" },
			{ "<leader>qy", desc = "copy macro" },
			{ "<leader>qb", desc = "break macro" },
		},
		opts = {
			clear = true,
			mapping = {
				startStopRecording = "Q",
				playMacro = "q",
				switchSlot = "<leader>qc",
				editMacro = "<leader>qe",
				yankMacro = "<leader>qy",
				addBreakPoint = "<leader>qb",
			},
			lessNotifications = true,
		},
	},

	--mini-ai
	{
		"echasnovski/mini.ai",
		keys = {
			{ "a", mode = { "x", "o" } },
			{ "i", mode = { "x", "o" } },
		},
		dependencies = { "nvim-treesitter-textobjects" },
		opts = function()
			local ai = require("mini.ai")
			return {
				n_lines = 500,
				custom_textobjects = {
					o = ai.gen_spec.treesitter({
						a = { "@block.outer", "@conditional.outer", "@loop.outer" },
						i = { "@block.inner", "@conditional.inner", "@loop.inner" },
					}, {}),
					f = ai.gen_spec.treesitter({
						a = "@function.outer",
						i = "@function.inner",
					}, {}),
					c = ai.gen_spec.treesitter({
						a = "@class.outer",
						i = "@class.inner",
					}, {}),
				},
			}
		end,
		config = function(_, opts)
			require("mini.ai").setup(opts)
		end,
	},

	--surround
	{
		"kylechui/nvim-surround",
		version = "*",
		keys = {
			{ "s", mode = { "n", "v" } },
			{ "S", mode = { "v", "x" } },
			{ "ds", mode = { "n" } },
			{ "cs", mode = { "n" } },
		},
		opts = {
			keymaps = {
				normal = "s",
				normal_cur = "ss",
				normal_line = "S",
				normal_cur_line = "SS",
				viual = "<C-g>s",
				visual_line = "<C-g>s",
				delete = "ds",
				change = "cs",
			},
			aliases = {
				["<"] = ">",
				["b"] = { ")", "]", "}" },
				["q"] = { '"', "'", "`" },
				["s"] = { "}", "]", ")", ">", '"', "'", "`" },
			},
		},
	},

	--toggler
	{
		"nguyenvukhang/nvim-toggler",
		keys = {
			{
				"<leader>i",
				function()
					require("nvim-toggler").toggle()
				end,
				mode = { "n", "v" },
				desc = "toggle_boolean",
			},
		},
		opts = {},
	},

	--undotree
	{
		"mbbill/undotree",
		keys = {
			{ "<leader>u", "<cmd>UndotreeToggle<cr> <cmd>UndotreeFocus<cr>", desc = "UndoTree" },
		},
	},
}
