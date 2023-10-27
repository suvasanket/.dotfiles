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
						previewer = false,
						prompt_title = false,
						results_title = "Commands",
						prompt_prefix = " ",
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

	--Neotree
	{
		"nvim-neo-tree/neo-tree.nvim",
		event = "VimEnter",
		keys = {
			{ "<leader>e", "<cmd>Neotree toggle<cr>", desc = "Neotree" },
		},
		opts = {
			default_component_configs = {
				symbols = {
					added = "✚",
					deleted = "✖",
					modified = "",
					renamed = "󰑕",
					untracked = "",
					ignored = "",
					unstaged = "󰅘",
					staged = "",
					conflict = "",
				},
				indent = {
					with_expanders = true,
					expander_collapsed = "",
					expander_expanded = "",
					expander_highlight = "NeoTreeExpander",
				},
				icon = {
					folder_closed = "󰉋 ",
					folder_open = "󰝰 ",
					folder_empty = "󰉖 ",
					default = "󰈔",
				},
				name = {
					use_git_status_colors = false,
				},
			},
			enable_diagnostics = true,
			enable_git_status = true,
			close_if_last_window = true,
			source_selector = {
				show_scrolled_off_parent_node = true,
			},
			popup_border_style = "rounded",
			filesystem = {
				bind_to_cwd = true,
				follow_current_file = true,
				hijack_netrw_behavior = "open_default",
				filtered_items = {
					hide_dotfiles = false,
					hide_hidden = false,
				},
				window = {
					mappings = {
						["P"] = { "toggle_preview", config = { use_float = false } },
						["l"] = "open",
						["h"] = "navigate_up",
						["-"] = "open_split",
						["|"] = "open_vsplit",
						["/"] = "none",

					},
				},
			},
			event_handlers = {
				{
					event = "file_opened",
					---@diagnostic disable-next-line: unused-local
					handler = function(file_path)
						require("neo-tree").close_all()
					end,
				},
			},
		},
	},
}
