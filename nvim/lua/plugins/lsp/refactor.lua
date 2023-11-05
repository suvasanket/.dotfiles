--refactor
return
--refactor
{
	"ThePrimeagen/refactoring.nvim",
		--stylua: ignore
		keys = {
			{ "<leader>me", function() require("refactoring").refactor("Extract Function") end, mode = "x", desc = "func" },
			{ "<leader>mf", function() require("refactoring").refactor("Extract Function To File") end, mode = "x", desc = "func to file" },
			-- Extract function supports only visual mode
			{ "<leader>mv", function() require("refactoring").refactor("Extract Variable") end, mode = "x", desc = "var" },
			-- Extract variable supports only visual mode
			{ "<leader>mI", function() require("refactoring").refactor("Inline Function") end, mode = "n", desc = "inline func" },
			-- Inline func supports only normal
			{ "<leader>mi", function() require("refactoring").refactor("Inline Variable") end, mode = { "n", "x" }, desc = "inline var" },
			-- Inline var supports both normal and visual mode
			{ "<leader>mb", function() require("refactoring").refactor("Extract Block") end, mode = "n", desc = "to block" },
			{ "<leader>mbf", function() require("refactoring").refactor("Extract Block To File") end, mode = "n", desc = "block to file" },
			-- Extract block supports only normal mode
		},
	opts = {
		prompt_func_return_type = {
			go = false,
			java = true,

			cpp = false,
			c = true,
			h = true,
			hpp = false,
			cxx = false,
		},
		prompt_func_param_type = {
			go = false,
			java = true,

			cpp = false,
			c = true,
			h = true,
			hpp = false,
			cxx = false,
		},
		printf_statements = {},
		print_var_statements = {},
	},
}
