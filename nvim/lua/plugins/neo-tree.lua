return {
	"nvim-neo-tree/neo-tree.nvim",
	cmd = "Neotree",
	keys = {
		{ "<leader>e", "<cmd>Neotree toggle<CR>", desc = "Toggle explorer" },
	},
	init = function()
		vim.g.neo_tree_remove_legacy_commands = 1
	end,
	opts = function()
		return {
			close_if_last_window = true,
			filesystem = {
				follow_current_file = { enabled = true },
				hijack_netrw_behavior = "open_current",
				filtered_items = {
					hide_hidden = false, -- only works on Windows for hidden files/directories
				},
				window = {
					mappings = {
						["d"] = function(state)
							local inputs = require("neo-tree.ui.inputs")
							local path = state.tree:get_node().path
							local msg = "Trash " .. path
							inputs.confirm(msg, function(confirmed)
								if not confirmed then
									return
								end

								vim.fn.system({ "trash", vim.fn.fnameescape(path) })
								require("neo-tree.sources.manager").refresh(state.name)
							end)
						end,
					},
				},
			},
			source_selector = {
				winbar = false,
				statusline = true, -- toggle to show selector on statusline
				content_layout = "center",
				tabs_layout = "equal",
				sources = {
					{ source = "filesystem", display_name = "" },
					{ source = "buffers", display_name = "" },
					{ source = "git_status", display_name = "" },
					{ source = "document_symbols", display_name = "" },
				},
			},
			window = {
				mappings = {
					["<space>"] = "none",
					["/"] = "none",
					["<tab>"] = "toggle_node",
					["h"] = "navigate_up",
					["l"] = "open",
				},
			},
			default_component_configs = {
				container = {
					enable_character_fade = true,
				},
				indent = {
					indent_size = 2,
					padding = 1, -- extra padding on left hand side
					-- indent guides
					with_markers = true,
					highlight = "NeoTreeIndentMarker",
					-- expander config, needed for nesting files
					with_expanders = true, -- if nil and file nesting is enabled, will enable expanders
					expander_highlight = "NeoTreeExpander",
				},
				icon = {
					default = "*",
					highlight = "NeoTreeFileIcon",
				},
				modified = {
					highlight = "NeoTreeModified",
				},
				name = {
					trailing_slash = false,
					use_git_status_colors = true,
					highlight = "NeoTreeFileName",
				},
				git_status = {
					symbols = {
						-- Change type
						modified = "", -- or "", but this is redundant info if you use git_status_colors on the name
						-- Status type
					},
				},
			},
			event_handlers = {
				{
					event = "file_opened",
					---@diagnostic disable-next-line: unused-local
					handler = function(file_path)
						-- auto close
						-- vimc.cmd("Neotree close")
						-- OR
						require("neo-tree.command").execute({ action = "close" })
					end,
				},
			},
		}
	end,
}
