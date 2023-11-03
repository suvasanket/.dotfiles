local lsp = require("lspconfig")
local root_pattern = lsp.util.root_pattern

--capabilities
local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities.textDocument.completion.completionItem.snippetSupport = true
capabilities.textDocument.foldingRange = {
	dynamicRegistration = false,
	lineFoldingOnly = true,
}

--lsp-virtualText_prefix--
vim.diagnostic.config({
	virtual_text = {
		prefix = "",
	},
	update_in_insert = true,
	severity_sort = true,
})

--lsp-gutterSigns--
local signs = { Error = "󰇙 ", Warn = "󰇙", Hint = "󰇙", Info = "󰇙" }
for type, icon in pairs(signs) do
	---@diagnostic disable-next-line: redefined-local
	local hl = "DiagnosticSign" .. type
	vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = "" })
end

--lsp on_attach
local on_attach = function(client, bufnr)
	local opts = { noremap = true, silent = true, buffer = bufnr }
	vim.keymap.set("n", "gD", vim.lsp.buf.declaration, opts)
	vim.keymap.set("n", "gi", vim.lsp.buf.implementation, opts)
	vim.keymap.set("n", "gd", "<cmd>Lspsaga goto_definition<cr>", opts)
	vim.keymap.set("n", "gr", "<cmd>Lspsaga finder<cr>", opts)
	vim.keymap.set("n", "gtd", "<cmd>Lspsaga goto_type_definition<cr>", opts)
	vim.keymap.set("n", "K","<cmd>Lspsaga hover_doc<cr>", opts)
	vim.keymap.set("n", "<leader>k", vim.lsp.buf.signature_help, opts)
	vim.keymap.set("n", "<space>wa", vim.lsp.buf.add_workspace_folder, opts)
	vim.keymap.set("n", "<space>wr", vim.lsp.buf.remove_workspace_folder, opts)
	vim.keymap.set("n", "<space>wl", function()
		print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
	end, opts)

	if client.server_capabilities.inlayHintProvider then
		vim.lsp.buf.inlay_hint(bufnr, true)
	end
end

--lsp default_config
lsp.util.default_config = vim.tbl_extend("force", lsp.util.default_config, {
	capabilities = capabilities,
	on_attach = on_attach,
})

--lua
lsp.lua_ls.setup({
	settings = {
		Lua = {
			hint = {
				enable = true,
			},
		},
	},
})

--tsserver
lsp.tsserver.setup({
	root_dir = root_pattern("package.json", "tsconfig.json", "jsconfig.json", ".git"),
	settings = {
		javascript = {
			inlayHints = {
				includeInlayEnumMemberValueHints = true,
				includeInlayFunctionLikeReturnTypeHints = true,
				includeInlayFunctionParameterTypeHints = true,
				includeInlayParameterNameHints = "all",
				includeInlayParameterNameHintsWhenArgumentMatchesName = true,
				includeInlayPropertyDeclarationTypeHints = true,
				includeInlayVariableTypeHints = true,
			},
		},
	},
})

--css
lsp.cssls.setup({
	single_file_support = false,
})

--html
lsp.emmet_ls.setup({})

--c/c++
lsp.clangd.setup({})
