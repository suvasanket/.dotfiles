return {
	"luukvbaal/statuscol.nvim",
	event = { "BufReadPre", "BufNewFile" },
	config = function()
		local builtin = require("statuscol.builtin")
		require("statuscol").setup({
			ft_ignore = { "nvim-tree", "alpha", "Trouble" },
			relculright = true,
			segments = {
				{
					sign = { name = { "Dap*" }, auto = true },
					click = "v:lua.ScSa",
				},
				{ text = { builtin.lnumfunc, " " }, click = "v:lua.ScLa" },
				{
					sign = {
						namespace = { "gitsign*" },
						name = { "Diagnostic" },
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
