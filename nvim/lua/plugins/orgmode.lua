return {
	{
		"nvim-orgmode/orgmode",
		ft = "org",
		config = function()
			require("orgmode").setup_ts_grammar()

			-- Setup orgmode
			require("orgmode").setup({
				org_agenda_files = "~/orgfiles/**/*",
				org_default_notes_file = "~/org/refile.org",
			})
		end,
	},
}
