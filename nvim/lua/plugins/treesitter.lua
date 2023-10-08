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
							["]f"] = { query = "@function.*", desc = "next function" },
							["]l"] = { query = "@loop.*", desc = "next loop" },
							["]c"] = { query = "@conditional.*", desc = "next conditional" },
							-- ["[c"] = "@class.outer",
						},
						goto_previous = {
							["[f"] = { query = "@function.*", desc = "prev function" },
							["[l"] = { query = "@loop.*", desc = "prev loop" },
							["[c"] = { query = "@conditional.*", desc = "prev conditional" },
							-- ["[c"] = "@class.outer",
						},
					},
				},
			})
		end,
	},

	--ts-context
	{
		"nvim-treesitter/nvim-treesitter-context",
		event = { "BufRead", "BufNewFile" },
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
}