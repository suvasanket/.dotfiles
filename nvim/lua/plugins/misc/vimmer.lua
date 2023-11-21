return {
	{
		"tpope/vim-sleuth",
		event = "BufRead",
	},

	{
		"tpope/vim-unimpaired",
		keys = {
			{ "[" },
			{ "]" },
		},
		dependencies = { "tpope/vim-repeat" },
	},

	{
		"ku1ik/vim-pasta",
		event = "VeryLazy",
	},
}
