return {
	{
		"tpope/vim-sleuth",
		event = "BufRead",
	},
	{
		"tpope/vim-unimpaired",
		event = "VeryLazy",
		dependencies = { "tpope/vim-repeat" },
	},
}
