return {
	--nvim-cmp
	{
		"hrsh7th/nvim-cmp",
		event = { "InsertEnter", "CmdlineEnter" },
		dependencies = {
			{ "onsails/lspkind.nvim" },
			{ "hrsh7th/cmp-nvim-lsp", event = "LspAttach" },
			{ "hrsh7th/cmp-buffer", event = "BufRead" },
			{ "hrsh7th/cmp-cmdline", event = "CmdlineEnter" },
			{ "hrsh7th/cmp-path" },
			{ "ray-x/cmp-treesitter", event = "BufRead" },
			{ "saadparwaiz1/cmp_luasnip", event = "InsertEnter" },
			{
				"Exafunction/codeium.nvim",
				event = "InsertEnter",
				config = function()
					require("codeium").setup({})
				end,
			},
		},
		config = function()
			local cmp = require("cmp")
			local cmp_autopairs = require("nvim-autopairs.completion.cmp")
			cmp.event:on("confirm_done", cmp_autopairs.on_confirm_done())
			cmp.setup({
				formatting = {
					fields = { "abbr", "menu", "kind" },
					format = require("lspkind").cmp_format({
						mode = "symbol_text",
						maxwidth = 70,
						menu = {
							nvim_lsp = "(l)",
							treesitter = "(t)",
							path = "(p)",
							buffer = "(b)",
							zsh = "(z)",
							luasnip = "(s)",
							cmdline = "(c)",
							codeium = "(c)",
							neorg = "(n)",
						},
					}),
				},
				completion = {
					keyword_length = 1,
					completeopt = "menu,noselect",
				},
				view = {
					entries = "custom",
				},
				snippet = {
					expand = function(args)
						require("luasnip").lsp_expand(args.body)
					end,
				},
				window = {
					completion = {
						border = "rounded",
					},
					documentation = {
						border = "rounded",
					},
				},
				experimental = {
					ghost_text = false,
				},
				mapping = cmp.mapping.preset.insert({
					["<C-u>"] = cmp.mapping.scroll_docs(-4),
					["<C-d>"] = cmp.mapping.scroll_docs(4),
					["<C-e>"] = cmp.mapping.abort(),
					["<CR>"] = cmp.mapping.confirm({ select = true }),
					["<tab>"] = function(fallback)
						if cmp.visible() then
							cmp.select_next_item()
						elseif require("luasnip").expand_or_jumpable() then
							require("luasnip").expand_or_jump()
						else
							fallback()
						end
					end,
					["<s-tab>"] = function(fallback)
						if cmp.visible() then
							cmp.select_prev_item()
						elseif require("luasnip").jumpable(-1) then
							require("luasnip").jump(-1)
						else
							fallback()
						end
					end,
					["<S-CR>"] = cmp.mapping.confirm({
						behavior = cmp.ConfirmBehavior.Replace,
						select = true,
					}),
				}),
				sources = {
					{ name = "path", priority = 100 },
					{ name = "nvim_lsp", priority = 95 },
					{ name = "treesitter", priority = 87 },
					{ name = "luasnip", priority = 82 },
					{ name = "buffer", priority = 50 },
					{ name = "codeium" },
					{ name = "neorg", priority = 100 },
					{ name = "orgmode", priority = 100 },
				},
			})

			-- Set configuration for specific filetype.
			cmp.setup.filetype("gitcommit", {
				sources = cmp.config.sources({
					{ name = "cmp_git" }, -- You can specify the `cmp_git` source if you were installed it.
				}, {
					{ name = "buffer" },
				}),
			})

			cmp.setup.cmdline({ "/", "?" }, {
				mapping = cmp.mapping.preset.cmdline(),
				sources = {
					{ name = "buffer", priority = 100 },
				},
			})

			cmp.setup.cmdline(":", {
				mapping = cmp.mapping.preset.cmdline(),
				sources = {
					{ name = "path", priority = 100 },
					{ name = "cmdline", priority = 70 },
				},
			})
		end,
	},
}
