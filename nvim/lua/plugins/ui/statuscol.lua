return {
	"luukvbaal/statuscol.nvim",
	event = { "BufReadPre", "BufNewFile" },
	config = function()
		local builtin = require("statuscol.builtin")
		require("statuscol").setup({
			ft_ignore = { "oil", "minintro", "Trouble", "undotree", "Outline" },
			relculright = false,
			segments = {
				{
					sign = {
						name = { "Dap*" },
						auto = true,
					},
					click = "v:lua.ScSa",
					condition = {
						function(args)
							return vim.api.nvim_get_current_win() == args.win
						end,
					},
				},
				{
					sign = {
						name = { "Diagnostic" },
						auto = true,
					},
					click = "v:lua.ScSa",
					condition = {
						function(args)
							return vim.api.nvim_get_current_win() == args.win
						end,
					},
				},
				{ text = { builtin.lnumfunc, " " }, click = "v:lua.ScLa" },
				{
					sign = {
						namespace = { "gitsign*" },
					},
					click = "v:lua.ScSa",
					condition = {
						function(args)
							return vim.api.nvim_get_current_win() == args.win
						end,
					},
				},
			},
		})
	end,
}
