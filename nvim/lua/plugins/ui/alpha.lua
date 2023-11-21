return {
	"goolord/alpha-nvim",
	event = "VimEnter",
	dependencies = { "MaximilianLloyd/ascii.nvim" },
	pin = true,
	config = function(_, startify)
		-- close Lazy and re-open when the dashboard is ready
		if vim.o.filetype == "lazy" then
			vim.cmd.close()
			vim.api.nvim_create_autocmd("User", {
				pattern = "AlphaReady",
				callback = function()
					---@diagnostic disable-next-line: different-requires
					require("lazy").show()
				end,
			})
		end

		require("alpha").setup(startify.opts)
	end,
	opts = function()
		local startify = require("alpha.themes.startify")
		startify.section.header.val = require("ascii").get_random_global()
		startify.section.top_buttons.val = { nil }
		startify.section.bottom_buttons.val = {
			-- require("alpha.fortune")(),
			startify.button("q", "quit", ":quit<CR>"),
			startify.button("l", "last session", ":SessionManager load_current_dir_session<CR>"),
		}
		return startify
	end,
}
