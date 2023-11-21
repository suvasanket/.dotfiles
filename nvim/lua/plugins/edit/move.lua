return {
	"echasnovski/mini.move",
	keys = {
		{ "<M-h>", mode = "x" },
		{ "<M-j>", mode = "x" },
		{ "<M-k>", mode = "x" },
		{ "<M-l>", mode = "x" },
	},
	config = function()
		require("mini.move").setup({
			mappings = {
				-- Move visual selection in Visual mode. Defaults are Alt (Meta) + hjkl.
				left = "<M-h>",
				right = "<M-l>",
				down = "<M-j>",
				up = "<M-k>",

				-- Move current line in Normal mode
				line_left = "",
				line_right = "",
				line_down = "",
				line_up = "",
			},

			-- Options which control moving behavior
			options = {
				reindent_linewise = true,
			},
		})
	end,
}
