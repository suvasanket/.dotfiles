return {
	--lua plugins that are other to use
	{ "nvim-lua/plenary.nvim", lazy = true },

	--icons
	{
		"nvim-tree/nvim-web-devicons",
		opts = { override_by_extension = {
			["norg"] = { icon = "󰂺", color = "#A2678A", name = "Norg" },
		} },
	},
}
