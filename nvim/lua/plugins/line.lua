return {
	--Lualine
	{
		"nvim-lualine/lualine.nvim",
		event = "BufAdd",
		config = function()
			local thyme = require("lualine.themes.codedark")
			local colors = {
				color1 = "#80a0ff",
				color2 = "#CEDEBD",
				color4 = "#080808", --black
				white = "#DFCCFB", --white
				red = "#ff5189", --red
				violet = "#FF9B50", --voilet
				grey = "#A8A196", --grey
				none = "NONE",
			}

			thyme = {
				normal = {
					a = { fg = colors.color2, bg = colors.none },
					b = { fg = colors.white, bg = colors.none },
					c = { fg = colors.grey, bg = colors.none },
				},

				insert = { a = { fg = colors.violet, bg = colors.none } },
				visual = { a = { fg = colors.red, bg = colors.none } },
				replace = { a = { fg = colors.color1, bg = colors.none } },

				inactive = {
					a = { fg = colors.white, bg = colors.none },
					b = { fg = colors.white, bg = colors.none },
					c = { fg = colors.color4, bg = colors.none },
				},
			}

			require("lualine").setup({
				options = {
					icons_enabled = true,
					theme = thyme,
					component_separators = { left = "", right = "" },
					section_separators = { left = "", right = "" },
					disabled_filetypes = {
						statusline = { "alpha", "TelescopePrompt", "TelescopeResults" },
						winbar = { "alpha" },
					},
					globalstatus = true,
					ignore_focus = {},
					refresh = { statusline = 100 },
					fmt = string.lower,
				},

				sections = {
					lualine_a = {
						{ "mode" },
					},
					lualine_b = {
						-- { "overseer" },
						{ require("recorder").recordingStatus },
					},
					lualine_c = {
						"branch",
						"diff",
						function()
							return "%="
						end,
						{
							"filetype",
							colored = true,
							icon_only = true,
							icon = { align = "right" },
						},
						{
							"filename",
							path = 3,
							shorting_target = 40,
							symbols = {
								modified = "󰳻",
								readonly = "",
								unnamed = "[No Name]",
								newfile = "󰎔",
							},
						},
					},
					lualine_x = {
						{
							"diagnostics",
							symbols = { error = " ", warn = " ", info = " " },
						},
					},
					lualine_y = {},
					lualine_z = {
						"encoding",
						"filesize",
						-- Lsp server name .
						{
							function()
								local msg = ""
								local buf_ft = vim.api.nvim_buf_get_option(0, "filetype")
								local clients = vim.lsp.get_active_clients()
								if next(clients) == nil then
									return msg
								end
								for _, client in ipairs(clients) do
									local filetypes = client.config.filetypes
									if filetypes and vim.fn.index(filetypes, buf_ft) ~= -1 then
										return client.name
									end
								end
								return msg
							end,
						},
					},
				},
				tabline = {},
				inactive_winbar = {},
				extensions = { "neo-tree", "fugitive", "nvim-dap-ui", "lazy", "overseer" },
			})
		end,
	},

	--bar
	{
		"akinsho/bufferline.nvim",
		event = "BufAdd",
		opts = {
			options = {
				always_show_bufferline = true,
				show_buffer_close_icons = false,
				themable = true,
				diagnostics = "nvim_lsp",
				offsets = {
					{
						filetype = "neo-tree",
						text = "NeoTree",
						text_align = "left",
						highlight = "Directory",
						separator = true,
					},
				},

			},
			highlights = {
				indicator_selected = {
					fg = "#C3EDC0",
				},
			},

		},
	},
}
