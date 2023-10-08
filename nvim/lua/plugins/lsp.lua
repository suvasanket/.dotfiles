return {
	--lsp-config
	{
		"neovim/nvim-lspconfig",
		event = { "BufReadPre", "BufNewFile" },
		config = function()
			require("lspconfig.ui.windows").default_options.border =
				{ "╭", "─", "╮", "│", "╯", "─", "╰", "│" }
		end,
	},

	--conform
	{
		"stevearc/conform.nvim",
		event = { "BufWritePre" },
		keys = {
			{
				"<F1>",
				function()
					require("conform").format()
				end,
				mode = { "n", "i" },
				desc = "format",
			},
		},
		opts = {
			formatters_by_ft = {
				["*"] = { "codespell" },
				lua = { "stylua" },
				javascript = { "prettier" },
				html = { "prettier" },
				css = { "prettier" },
				c = { "clang_format" },
				java = { "clang_format" },
				zsh = { "beautysh" },
			},
			format_on_save = {
				timeout_ms = 500,
				lsp_fallback = true,
			},
		},
	},

	--linting
	{
		"mfussenegger/nvim-lint",
		ft = {},
		keys = {
			{
				"<F2>",
				function()
					require("lint").try_lint()
				end,
				desc = "Trigger linting for current file",
			},
		},
		config = function()
			require("lint").linters_by_ft = {}

			vim.api.nvim_create_autocmd({ "BufEnter", "BufWritePost", "InsertLeave" }, {
				callback = function()
					require("lint").try_lint()
				end,
			})
		end,
	},

	--Lspsaga
	{
		"glepnir/lspsaga.nvim",
		event = "LspAttach",
		--stylua: ignore
		keys = {
			{ "gr", "<cmd>Lspsaga finder<cr>", desc = "lspFinder" },
			{ "<leader>pd", "<cmd>Lspsaga peek_definition<CR>", desc = "peek_defination" },
			{ "<Leader>pi", "<cmd>Lspsaga incoming_calls<CR>", desc = "incoming_calls" },
			{ "<Leader>po", "<cmd>Lspsaga outgoing_calls<CR>", desc = "outgoing_calls" },
			{ "<leader>pt", "<cmd>Lspsaga peek_type_definition<CR>", desc = "peek_type_definition" },
			{ "<leader>wd", "<cmd>Lspsaga show_workspace_diagnostics<CR>", desc = "workspaceDiagnostics" },
			{ "<leader>bd", "<cmd>Lspsaga show_buf_diagnostics<CR>", desc = "bufDiagnostics" },
			{ "<F4>", "<cmd>Lspsaga code_action<CR>", desc = "code_action" },
			{ "<F3>", "<cmd>Lspsaga rename<CR>", desc = "rename" },
			{ "[d", "<cmd>Lspsaga diagnostic_jump_prev<CR>", desc = "diagnostic" },
			{ "]d", "<cmd>Lspsaga diagnostic_jump_next<CR>", desc = "diagnostic" },
			{ "[e", function() require("lspsaga.diagnostic"):goto_prev({ severity = vim.diagnostic.severity.ERROR }) end, desc = "Error" },
			{ "]e", function() require("lspsaga.diagnostic"):goto_next({ severity = vim.diagnostic.severity.ERROR }) end, desc = "Error" },
			{ "K", "<cmd>Lspsaga hover_doc<CR>" },
		},
		opts = {
			code_action = {
				num_shortcut = false,
				keys = { quit = { "q", "<C-c>" } },
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
				title = true,
			},
			symbol_in_winbar = {
				enable = false,
				separator = "ࣸࣸࣸ 󰁔",
				show_file = false,
				folder_level = 1,
			},
			lightbulb = {
				virtual_text = false,
				sign = true,
			},
		},
	},
}
