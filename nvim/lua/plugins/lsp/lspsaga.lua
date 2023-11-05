return {
	"glepnir/lspsaga.nvim",
	event = "LspAttach",
		--stylua: ignore
		keys = {
			{ "<leader>cpd", "<cmd>Lspsaga peek_definition<CR>", desc = "peek_defination" },
			{ "<Leader>cci", "<cmd>Lspsaga incoming_calls<CR>", desc = "incoming_calls" },
			{ "<Leader>cco", "<cmd>Lspsaga outgoing_calls<CR>", desc = "outgoing_calls" },
			{ "<leader>cpt", "<cmd>Lspsaga peek_type_definition<CR>", desc = "peek_type_definition" },
			{ "<leader>bd", "<cmd>Lspsaga show_buf_diagnostics<CR>", desc = "bufDiagnostics" },
			{ "<leader>ca", "<cmd>Lspsaga code_action<CR>", desc = "code_action" },
			{ "<leader>cr", "<cmd>Lspsaga rename<CR>", desc = "rename" },
			{ "[d", "<cmd>Lspsaga diagnostic_jump_prev<CR>", desc = "diagnostic" },
			{ "]d", "<cmd>Lspsaga diagnostic_jump_next<CR>", desc = "diagnostic" },
			{ "[e", function() require("lspsaga.diagnostic"):goto_prev({ severity = vim.diagnostic.severity.ERROR }) end, desc = "Error" },
			{ "]e", function() require("lspsaga.diagnostic"):goto_next({ severity = vim.diagnostic.severity.ERROR }) end, desc = "Error" },
			{"<leader>t","<cmd>Lspsaga term_toggle<cr>",desc="term_toggle"}
		},
	opts = {
		code_action = {
			num_shortcut = false,
			keys = { quit = { "q", "<C-c>" } },
		},
		rename = {
			keys = { quit = { "<C-c>" } },
		},
		finder = {
			max_height = 0.6,
			keys = {
				vsplit = "|",
				split = "_",
				toggle_or_open = "<cr>",
			},
		},

		definition = {
			keys = {
				edit = "<cr>",
				vsplit = "|",
				split = "_",
			},
		},
		ui = {
			border = "rounded",
			code_action = "",
			title = false,
		},
		symbol_in_winbar = {
			enable = false,
			separator = "ࣸࣸࣸ 󰁔",
			show_file = false,
			folder_level = 1,
		},
		lightbulb = {
			virtual_text = false,
			sign = false,
		},
	},
}
