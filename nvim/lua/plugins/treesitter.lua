return {
	--Treesitter
	{
		"nvim-treesitter/nvim-treesitter",
		build = ":TSUpdate",
		event = { "BufRead", "BufNewFile" },
		dependencies = {
			{ "nvim-treesitter/nvim-treesitter-textobjects" },
		},
		config = function()
			require("nvim-treesitter.configs").setup({
				ensure_installed = { "lua", "javascript", "java", "html", "css", "vim", "c" },
				sync_install = true,
				auto_install = true,
				ignore_install = {},
				highlight = {
					enable = true,
					---@diagnostic disable-next-line: unused-local
					disable = function(lang, buf)
						local max_filesize = 100 * 1024 -- 100 KB
						local ok, stats = pcall(vim.loop.fs_stat, vim.api.nvim_buf_get_name(buf))
						if ok and stats and stats.size > max_filesize then
							return true
						end
					end,

					additional_vim_regex_highlighting = true,
				},
				--text-object
				textobjects = {
					select = {
						enable = true,
						lookahead = true,
					},
					swap = {
						enable = true,
						swap_next = {
							["<leader><leader>a"] = { query = "@parameter.inner", desc = "swap parameter next" },
						},
						swap_previous = {
							["<leader><leader>A"] = { query = "@parameter.inner", desc = "swap parameter next" },
						},
					},
					move = {
						enable = true,
						set_jumps = true, -- whether to set jumps in the jumplist
						goto_next = {
							["]m"] = { query = "@function.*", desc = "next function" },
							["]l"] = { query = "@loop.*", desc = "next loop" },
							["]c"] = { query = "@conditional.*", desc = "next conditional" },
							-- ["[c"] = "@class.outer",
							["]z"] = { query = "@fold", query_group = "folds", desc = "next fold" },
						},
						goto_previous = {
							["[m"] = { query = "@function.*", desc = "prev function" },
							["[l"] = { query = "@loop.*", desc = "prev loop" },
							["[c"] = { query = "@conditional.*", desc = "prev conditional" },
							-- ["[c"] = "@class.outer",
							["[z"] = { query = "@fold", query_group = "folds", desc = "prev fold" },
						},
					},
				},
			})
		end,
	},

	--ts-context
	{
		"nvim-treesitter/nvim-treesitter-context",
		event = "VeryLazy",
		opts = {
			enable = true,
			max_lines = 0,
			min_window_height = 1,
			line_numbers = true,
			multiline_threshold = 20,
			trim_scope = "outer",
			mode = "topline",
			separator = nil,
			zindex = 20,
			on_attach = nil,
		},
	},

	--refactor
	{
		"ThePrimeagen/refactoring.nvim",
		--stylua: ignore
		keys = {
			{ "<leader>me", function() require("refactoring").refactor("Extract Function") end, mode = "x", desc = "func" },
			{ "<leader>mf", function() require("refactoring").refactor("Extract Function To File") end, mode = "x", desc = "func to file" },
			-- Extract function supports only visual mode
			{ "<leader>mv", function() require("refactoring").refactor("Extract Variable") end, mode = "x", desc = "var" },
			-- Extract variable supports only visual mode
			{ "<leader>mI", function() require("refactoring").refactor("Inline Function") end, mode = "n", desc = "inline func" },
			-- Inline func supports only normal
			{ "<leader>mi", function() require("refactoring").refactor("Inline Variable") end, mode = { "n", "x" }, desc = "inline var" },
			-- Inline var supports both normal and visual mode
			{ "<leader>mb", function() require("refactoring").refactor("Extract Block") end, mode = "n", desc = "to block" },
			{ "<leader>mbf", function() require("refactoring").refactor("Extract Block To File") end, mode = "n", desc = "block to file" },
			-- Extract block supports only normal mode
		},
		opts = {
			prompt_func_return_type = {
				go = false,
				java = true,

				cpp = false,
				c = true,
				h = true,
				hpp = false,
				cxx = false,
			},
			prompt_func_param_type = {
				go = false,
				java = true,

				cpp = false,
				c = true,
				h = true,
				hpp = false,
				cxx = false,
			},
			printf_statements = {},
			print_var_statements = {},
		},
	},
}
