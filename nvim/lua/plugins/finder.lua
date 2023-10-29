return {
	--Telescope
	{
		"nvim-telescope/telescope.nvim",
		dependencies = {},
		--stylua: ignore
		keys = {
			{ "<leader>-", function () vim.cmd("split") if #vim.fn.getbufinfo({ buflisted = 1 }) == 1 then vim.cmd("Telescope find_files") else vim.cmd("Telescope buffers") end end, desc = "split" },
			{ "<leader>|", function () vim.cmd("vsplit") if #vim.fn.getbufinfo({ buflisted = 1 }) == 1 then vim.cmd("Telescope find_files") else vim.cmd("Telescope buffers") end end, desc = "vsplit" },
			{ "<leader>fo", "<cmd>Telescope oldfiles<cr>", desc = "RecentFile" },
			{ "<leader>fh", "<cmd>Telescope command_history<cr>", desc = "CommandHist" },
			{ "<leader>fb", "<cmd>Telescope buffers<cr>", desc = "Buffers" },
			{ "<leader>fp", "<cmd>Telescope projects<cr>", desc = "Project" },
			{ "<leader>ff","<cmd>Telescope find_files<cr>", desc = "Find_file" },
			{ "<leader>fc", function() require("telescope.builtin").find_files({ search_dirs = { "~/.config/nvim" },path_display={"tail"} }) end, desc = "Config_file" },
			{ "<leader>bs", "<cmd>Telescope lsp_document_symbols<cr>", desc = "Symbols" },
			{ "<leader>bg", "<cmd>Telescope current_buffer_fuzzy_find<cr>", desc = "current_buffer_fuzzy_find" },
			{ "<leader>ws", "<cmd>Telescope lsp_workspace_symbols<cr>", desc = "Workspace_symbols" },
			{ "<leader>wg", "<cmd>Telescope grep_string<cr>", desc = "Live_grep" },
			{ "<leader>gb", "<cmd>Telescope git_branches<cr>", desc = "git branches" },
			{ "<leader>gf", "<cmd>Telescope git_files<cr>", desc = "git files" },
			{ "<leader>gc", "<cmd>Telescope git_commits<cr>", desc = "git commits" },
			{ "<M-x>" ,"<cmd>Telescope<cr>"},
			{ "<leader>ms", function () require("telescope").extensions.notify.notify({ layout_config = { preview_width = 0.6 } }) end, desc = "Messages" },
			{ "<leader>no",function () vim.cmd "vsplit" require("telescope.builtin").find_files({ search_dirs = { "~/neorg" } }) end, desc = "Neorg file open"}
		},
		config = function()
			require("telescope").setup({
				defaults = {
					layout_strategy = "horizontal",
					layout_config = {
						height = 0.8,
						horizontal = {
							prompt_position = "top",
						},
					},
					sorting_strategy = "ascending",
					--- other configs
					prompt_prefix = " ",
					selection_caret = "󰁕 ",
					mappings = {
						i = {
							["<C-[>"] = require("telescope.actions").close,
							["<C-j>"] = "move_selection_next",
							["<C-k>"] = "move_selection_previous",
						},
					},
				},
				pickers = {
					find_files = {
						previewer = true,
						hidden = true,
						file_ignore_patterns = { "*/node_modules/*", "*/.git/*" },
					},
					builtin = {
						theme = "ivy",
						border = false,
						previewer = false,
						prompt_title = false,
						results_title = "Commands",
						prompt_prefix = " ",
						layout_config = {
							height = 0.4,
						},
					},
					git_commits = {
						theme = "dropdown",
						layout_config = {
							height = 0.4,
						},
					},
					git_branches = {
						theme = "dropdown",
						layout_config = {
							height = 0.4,
						},
					},
					grep_string = {
						layout_config = {
							preview_width = 0.6,
						},
					},
					current_buffer_fuzzy_find = {
						layout_config = {
							preview_width = 0.6,
						},
					},
				},
				extensions = {},
			})
			require("telescope").load_extension("projects")
		end,
	},

	--project
	{
		"ahmedkhalf/project.nvim",
		event = "VeryLazy",
		config = function()
			require("project_nvim").setup({
				detection_methods = { "lsp", "pattern" },
				patterns = { ".git", "package.json", ">init.lua", "pom.xml", "=neorg" },
				exclude_dirs = { "*/node_modules/*" },
			})
		end,
	},
}
