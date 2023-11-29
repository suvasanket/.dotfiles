return {
	"echasnovski/mini.indentscope",
	enabled = false,
	event = { "BufReadPre", "BufNewFile" },
	opts = {
		symbol = "│",
		options = { try_as_border = true },
	},
	init = function()
		vim.api.nvim_create_autocmd("FileType", {
			pattern = {
				"help",
				"alpha",
				"neo-tree",
				"Trouble",
				"lazy",
				"mason",
				"notify",
				"undotree",
				"help",
				"vifm",
			},
			callback = function()
				vim.b.miniindentscope_disable = true
			end,
		})
	end,
}
