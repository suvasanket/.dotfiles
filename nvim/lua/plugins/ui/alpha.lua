return{
	"goolord/alpha-nvim",
	event = "VimEnter",
	pin = true,
	config = function()
		require("alpha.themes.dashboard").section.footer.val = require("alpha.fortune")()
		require("alpha").setup(require("alpha.themes.startify").opts)
	end,
}
