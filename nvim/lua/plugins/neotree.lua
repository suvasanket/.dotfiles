return {
	"nvim-neo-tree/neo-tree.nvim",
	event = "VimEnter",
	keys = {
		{ "<leader>e", "<cmd>Neotree toggle<cr>", desc = "Neotree" },
	},
	config = function()
		require("neo-tree").setup({
			window = {
				mappings = {
					["e"] = function()
						vim.api.nvim_exec("Neotree focus filesystem left", true)
					end,
					["b"] = function()
						vim.api.nvim_exec("Neotree focus buffers left", true)
					end,
					["g"] = function()
						vim.api.nvim_exec("Neotree focus git_status left", true)
					end,
				},
			},
			default_component_configs = {
				git_status = {
					symbols = {
						added = "✚ ",
						deleted = "✖ ",
						modified = "",
						renamed = " ",
						untracked = "",
						ignored = " ",
						unstaged = " ",
						staged = " ",
						conflict = " ",
					},
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
			popup_border_style = "rounded",
			enable_diagnostics = true,
			close_if_last_window = true,
			source_selector = {
				show_scrolled_off_parent_node = true,
			},
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
						["i"] = "run_command",
						["d"] = "Delete",
						["D"] = "delete",
					},
				},
			},
			git_status = {
				window = {
					mappings = {
						["S"] = "git_add_all",
						["u"] = "git_unstage_file",
						["s"] = "git_add_file",
						["r"] = "git_revert_file",
						["cc"] = "git_commit",
						["P"] = "git_push",
						["cp"] = "git_commit_and_push",
						["o"] = { "show_help", nowait = false, config = { title = "Order by", prefix_key = "o" } },
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
			commands = {
				run_command = function(state)
					local node = state.tree:get_node()
					local path = node:get_id()
					vim.api.nvim_input(": " .. path .. "<Home>")
				end,

				-- over write default 'delete' command to 'trash'.
				Delete = function(state)
					local inputs = require("neo-tree.ui.inputs")
					local path = state.tree:get_node().path
					local msg = "Are you sure you want to trash " .. path
					inputs.confirm(msg, function(confirmed)
						if not confirmed then
							return
						end

						vim.fn.system({ "trash", vim.fn.fnameescape(path) })
						require("neo-tree.sources.manager").refresh(state.name)
					end)
				end,

				-- over write default 'delete_visual' command to 'trash' x n.
				Delete_visual = function(state, selected_nodes)
					local inputs = require("neo-tree.ui.inputs")

					-- get table items count
					function GetTableLen(tbl)
						local len = 0
						---@diagnostic disable-next-line: unused-local
						for n in pairs(tbl) do
							len = len + 1
						end
						return len
					end

					local count = GetTableLen(selected_nodes)
					local msg = "Are you sure you want to trash " .. count .. " files ?"
					inputs.confirm(msg, function(confirmed)
						if not confirmed then
							return
						end
						for _, node in ipairs(selected_nodes) do
							vim.fn.system({ "trash", vim.fn.fnameescape(node.path) })
						end
						require("neo-tree.sources.manager").refresh(state.name)
					end)
				end,
			},
		})
	end,
}
