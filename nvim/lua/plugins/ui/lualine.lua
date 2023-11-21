return {
	"nvim-lualine/lualine.nvim",
	event = "VeryLazy",
	config = function()
		local thyme = require("lualine.themes.codedark")
		local colors = {
			inactive = "#A2B29F",
			color1 = "#80a0ff",
			color2 = "#C8E4B2",
			color4 = "#080808", --black
			white = "#DFCCFB", --white
			red = "#ff5189", --red
			neon = "#D0A2F7", --voilet
			grey = "#A8A196", --grey
			none = "NONE",
			nbg = "#352F44",
			ibg = "#1A120B",
		}

		thyme = {
			normal = {
				a = { fg = colors.color2, bg = colors.none, gui = "bold" },
				b = { fg = colors.white, bg = colors.none },
				c = { fg = colors.grey, bg = colors.none },
			},
			insert = {
				a = { fg = colors.neon, bg = colors.none, gui = "bold" },
				b = { fg = colors.white, bg = colors.none },
				c = { fg = colors.grey, bg = colors.none },
			},
			visual = {
				a = { fg = colors.red, bg = colors.none, gui = "bold" },
				b = { fg = colors.white, bg = colors.none },
				c = { fg = colors.grey, bg = colors.none },
			},
			replace = {
				a = { fg = colors.color1, bg = colors.none, gui = "bold" },
				b = { fg = colors.white, bg = colors.none },
				c = { fg = colors.grey, bg = colors.none },
			},
			inactive = {
				a = { fg = colors.inactive, bg = colors.none, gui = "bold" },
				b = { fg = colors.inactive, bg = colors.none },
				c = { fg = colors.grey, bg = colors.none },
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
						padding = { left = 0, right = 1 },
					},
					{
						"mode",
						fmt = function(str)
							if str:sub(1, 1) == "N" then
								return " "
							elseif str:sub(1, 1) == "I" then
								return "󰗧 "
							elseif str:sub(1, 1) == "V" then
								return "󰆽 "
							elseif str:sub(1, 1) == "T" then
								return " "
							elseif str:sub(1, 1) == "S" then
								return " "
							elseif str:sub(1, 1) == "C" then
								return "󰘳 "
							elseif str:sub(1, 1) == "O" then
								return "󰔟 "
							end
							return "[" .. str:sub(1, 1) .. "]"
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
				lualine_b = {
					{ require("recorder").recordingStatus },
				},
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
						padding = { left = 0, right = 1 },
					},
					{
						"mode",
						fmt = function(str)
							if str:sub(1, 1) == "N" then
								return " "
							elseif str:sub(1, 1) == "I" then
								return "󰗧 "
							elseif str:sub(1, 1) == "V" then
								return "󰆽 "
							elseif str:sub(1, 1) == "T" then
								return " "
							elseif str:sub(1, 1) == "S" then
								return " "
							elseif str:sub(1, 1) == "C" then
								return "󰘳 "
							elseif str:sub(1, 1) == "O" then
								return "󰔟 "
							end
							return "[" .. str:sub(1, 1) .. "]"
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
				lualine_b = {
					{ require("recorder").recordingStatus },
				},
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
			-- inactive_winbar = { lualine_z = { "filename" } },
			tabline = {},
			extensions = { "noice", "symbols-outline", "neo-tree", "fugitive", "lazy", "Trouble", "nvim-dap-ui" },
		})
	end,
}
