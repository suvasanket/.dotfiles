return {
	"nvim-lualine/lualine.nvim",
	event = "VeryLazy",
	pin = true,
	config = function()
		local thyme = require("lualine.themes.codedark")
		local colors = {
			inactive = "#A2B29F",
			color1 = "#80a0ff",
			color2 = "#C8E4B2",
			color4 = "#080808", --black
			color5 = "#DFCCFB", --white
			color6 = "#ff5189", --red
			color7 = "#D0A2F7", --voilet
			color8 = "#A8A196", --grey
			bg = "NONE",
			nbg = "#352F44",
			ibg = "#1A120B",
		}

		thyme = {
			normal = {
				a = { fg = colors.color2, bg = colors.bg, gui = "bold" },
				b = { fg = colors.color5, bg = colors.bg },
				c = { fg = colors.color8, bg = colors.bg },
			},
			insert = {
				a = { fg = colors.color7, bg = colors.bg, gui = "bold" },
				b = { fg = colors.color5, bg = colors.bg },
				c = { fg = colors.color8, bg = colors.bg },
			},
			visual = {
				a = { fg = colors.color6, bg = colors.bg, gui = "bold" },
				b = { fg = colors.color5, bg = colors.bg },
				c = { fg = colors.color8, bg = colors.bg },
			},
			replace = {
				a = { fg = colors.color1, bg = colors.bg, gui = "bold" },
				b = { fg = colors.color5, bg = colors.bg },
				c = { fg = colors.color8, bg = colors.bg },
			},
			inactive = {
				a = { fg = colors.inactive, bg = colors.bg, gui = "bold" },
				b = { fg = colors.inactive, bg = colors.bg },
				c = { fg = colors.color8, bg = colors.bg },
			},
		}
		require("lualine").setup({
			options = {
				icons_enabled = true,
				theme = thyme,
				component_separators = { left = "", right = "" },
				section_separators = { left = "", right = "" },
				disabled_filetypes = {
					statusline = { "alpha", "minintro" },
					winbar = { "alpha" },
				},
				globalstatus = false,
				ignore_focus = {},
				refresh = { statusline = 100 },
				-- fmt = string.lower,
			},

			sections = {
				lualine_a = {
					{
						function()
							return "▊"
						end,
						padding = { left = 0, right = 0 },
					},
					{
						"mode",
						fmt = function(str)
							return ">" .. str:sub(1, 1) .. "<"
						end,
					},
					{
						"filename",
						path = 1,
						shorting_target = 40,
						symbols = {
							modified = "󰳻",
							readonly = "",
							unnamed = "[No Name]",
							newfile = "󰎔",
						},
					},
				},
				lualine_b = {},
				lualine_c = {
					{ "branch", icon = "" },
					"diff",
				},
				lualine_x = {
					{
						function()
							local search = vim.fn.searchcount({ maxcount = 0 }) -- maxcount = 0 makes the number not be capped at 99
							local searchCurrent = search.current
							local searchTotal = search.total
							if searchCurrent > 0 and vim.v.hlsearch ~= 0 then
								return vim.fn.getreg("/") .. " [" .. searchCurrent .. "/" .. searchTotal .. "]"
							else
								return ""
							end
						end,
						color = "IncSearch", -- Highlight groups can also be used.
					},
					{
						"diagnostics",
						symbols = { error = " ", warn = " ", info = " " },
					},
					"encoding",
					"filesize",
				},
				lualine_y = {
					{
						"filetype",
						colored = true,
						icon_only = false,
						icon = { align = "left" },
					},
				},
				lualine_z = {
					-- Lsp server name .
					{
						function()
							local buf_ft = vim.api.nvim_buf_get_option(0, "filetype")
							local clients = vim.lsp.get_active_clients()
							if next(clients) == nil then
								return "󱘺 "
							end
							for _, client in ipairs(clients) do
								local filetypes = client.config.filetypes
								if filetypes and vim.fn.index(filetypes, buf_ft) ~= -1 then
									return "󰪩 " .. client.name
								end
							end
							return "󰴀 "
						end,
					},
					{
						function()
							return "▊"
						end,
						padding = { left = 1, right = 0 },
					},
				},
			},
			inactive_sections = {
				lualine_a = {
					{
						function()
							return "▊"
						end,
						padding = { left = 0, right = 0 },
					},
					{
						"mode",
						fmt = function(str)
							return ">" .. str:sub(1, 1) .. "<"
						end,
					},
					{
						"filename",
						path = 1,
						shorting_target = 40,
						symbols = {
							modified = "󰳻",
							readonly = "",
							unnamed = "[No Name]",
							newfile = "󰎔",
						},
					},
				},
				lualine_b = {},
				lualine_c = {
					{ "branch", icon = "" },
					"diff",
				},
				lualine_x = {
					{
						"diagnostics",
						symbols = { error = " ", warn = " ", info = " " },
					},
					"encoding",
					"filesize",
				},
				lualine_y = {
					{
						"filetype",
						colored = false,
						icon_only = false,
					},
				},
				lualine_z = {
					-- Lsp server name .
					{
						function()
							local buf_ft = vim.api.nvim_buf_get_option(0, "filetype")
							local clients = vim.lsp.get_active_clients()
							if next(clients) == nil then
								return "󱘺 "
							end
							for _, client in ipairs(clients) do
								local filetypes = client.config.filetypes
								if filetypes and vim.fn.index(filetypes, buf_ft) ~= -1 then
									return "󰪩 " .. client.name
								end
							end
							return "󰴀 "
						end,
					},
					{
						function()
							return "▊"
						end,
						padding = { left = 1, right = 0 },
					},
				},
			},
			-- inactive_winbar = { lualine_z = { "filename" } },
			tabline = {},
			extensions = {
				"telescope",
				"noice",
				"symbols-outline",
				"neo-tree",
				"fugitive",
				"lazy",
				"Trouble",
				"nvim-dap-ui",
			},
		})
	end,
}
