return {
	--lua plugins that are other to use
	{ "nvim-lua/plenary.nvim", lazy = true },

	--icons
	{
		"nvim-tree/nvim-web-devicons",
		opts = { override_by_extension = {
			["norg"] = { icon = "󰂺", color = "#D2E3C8" , name = "Norg" },
		} },
	},
}
