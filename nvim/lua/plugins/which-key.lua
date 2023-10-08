return {
	"folke/which-key.nvim",
	event = "VeryLazy",
	config = function()
		local wk = require("which-key")
		wk.register({
			["z"] = {
				["x"] = { name = "kill-buffer" },
			},
			["<leader>"] = {
				["q"] = { name = "+macro/session" },
				["r"] = { name = "+run" },
				["<leader>"] = { name = "+swap" },
				["w"] = {
					name = "+workspace/write",
					l = { "list_workspace_folders" },
					a = { "add_workspace_folder" },
					r = { "remove_workspace_folder" },
				},
				p = {
					name = "+lsp/project",
				},
				g = { name = "+git" },
				d = { name = "+dap" },
				b = { name = "+buffer" },
			},
			["g"] = {
				c = { "line-comment" },
				b = { "block-comment" },
				d = { "definition" },
				D = { "definition" },
				r = { "reference" },
				i = { "implementation" },
				t = {
					name = "type",
					d = { "definition" },
				},
			},
			["v"] = {
				i = {
					a = { "InsideArgument" },
					f = { "InsideFunction" },
					c = { "InsideClass " },
					o = { "InsideBlocks" },
					n = {
						name = "next",
						a = { "nextInsideArgument" },
						f = { "nextInsideFunction" },
						c = { "nextInsideClass " },
						o = { "nextInsideBlocks" },
					},
				},
				a = {
					a = { "AroundArgument" },
					f = { "AroundFunction" },
					c = { "AroundClass " },
					o = { "AroundBlocks" },
					n = {
						name = "next",
						a = { "nextAroundArgument" },
						f = { "nextAroundFunction" },
						c = { "nextAroundClass " },
						o = { "nextAroundBlocks" },
					},
				},
			},
			["y"] = {
				i = {
					a = { "AroundArgument" },
					f = { "AroundFunction" },
					c = { "AroundClass " },
					o = { "AroundBlocks" },
					n = {
						a = { "nextAroundArgument" },
						f = { "nextAroundFunction" },
						c = { "nextAroundClass " },
						o = { "nextAroundBlocks" },
					},
				},
				a = {
					a = { "AroundArgument" },
					f = { "AroundFunction" },
					c = { "AroundClass " },
					o = { "AroundBlocks" },
					n = {
						name = "next",
						a = { "nextAroundArgument" },
						f = { "nextAroundFunction" },
						c = { "nextAroundClass " },
						o = { "nextAroundBlocks" },
					},
				},
			},
			["d"] = {
				i = {
					a = { "AroundArgument" },
					f = { "AroundFunction" },
					c = { "AroundClass " },
					o = { "AroundBlocks" },
					n = {
						a = { "nextAroundArgument" },
						f = { "nextAroundFunction" },
						c = { "nextAroundClass " },
						o = { "nextAroundBlocks" },
					},
				},
				a = {
					a = { "AroundArgument" },
					f = { "AroundFunction" },
					c = { "AroundClass " },
					o = { "AroundBlocks" },
					n = {
						name = "next",
						a = { "nextAroundArgument" },
						f = { "nextAroundFunction" },
						c = { "nextAroundClass " },
						o = { "nextAroundBlocks" },
					},
				},
			},
		})
		vim.o.timeout = true
		vim.o.timeoutlen = 300
		require("which-key").setup({
			window = { border = { "╭", "─", "╮", "│", "╯", "─", "╰", "│" } },
		})
	end,
}
