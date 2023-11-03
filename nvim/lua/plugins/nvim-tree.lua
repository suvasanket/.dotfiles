return {
	"nvim-tree/nvim-tree.lua",
	keys = {
		{ "<leader>e", "<cmd>NvimTreeToggle<cr>", desc = "Toggle NvimTree" },
	},
	opts = {
		sync_root_with_cwd = true,
		respect_buf_cwd = true,
		update_focused_file = {
			enable = true,
			update_root = true,
		},
		view = {
			width = 35,
		},
		renderer = {
			full_name = true,
			group_empty = true,
			special_files = {},
			symlink_destination = false,
			indent_markers = {
				enable = true,
			},
			icons = {
				glyphs = {
					default = "󰈔",
					symlink = "",
					bookmark = "",
					modified = "●",
					folder = {
						default = "",
						open = "",
						empty = "",
						empty_open = "",
						symlink = "",
						symlink_open = " ",
					},
					git = {
						unstaged = "✗",
						staged = "✓",
						unmerged = "",
						renamed = "➜",
						untracked = "★",
						deleted = "",
						ignored = "◌",
					},
				},
				git_placement = "after",
				show = {
					file = true,
					folder = true,
					folder_arrow = false,
					git = true,
				},
			},
		},
		actions = {
			change_dir = {
				enable = false,
				restrict_above_cwd = true,
			},
			open_file = {
				quit_on_open = true,
				resize_window = false,
				window_picker = {
					chars = "aoeui",
				},
			},
			remove_file = {
				close_window = true,
			},
		},
		on_attach = function(bufnr)
			local api = require("nvim-tree.api")

			local function opts(desc)
				return { desc = "nvim-tree: " .. desc, buffer = bufnr, noremap = true, silent = true, nowait = true }
			end

			-- default mappings
			api.config.mappings.default_on_attach(bufnr)

			-- custom mappings
			vim.keymap.set("n", "l", api.node.open.edit, opts("Open"))
			vim.keymap.set("n", "h", api.tree.close, opts("Close"))
			vim.keymap.set("n", "H", api.tree.collapse_all, opts("Collapse All"))
		end,
	},
}
