return {
	"chrisgrieser/nvim-recorder",
	keys = {
		{ "Q", desc = "recorder" },
		{ "q", desc = "play" },
		{ "<leader>qc", desc = "change macro" },
		{ "<leader>qe", desc = "modify macro" },
		{ "<leader>qy", desc = "copy macro" },
		{ "<leader>qb", desc = "break macro" },
	},
	opts = {
		clear = true,
		mapping = {
			startStopRecording = "Q",
			playMacro = "q",
			switchSlot = "<leader>qc",
			editMacro = "<leader>qe",
			yankMacro = "<leader>qy",
			addBreakPoint = "<leader>qb",
		},
		lessNotifications = true,
	},
}
