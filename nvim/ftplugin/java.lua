---@diagnostic disable: undefined-global, unused-local
local jdtls = require("jdtls")
local cmp_nvim_lsp = require("cmp_nvim_lsp")

-- Change jdtls_path to wherever you have your Eclipse Java development tools (JDT) Language Server downloaded to.
local jdtls_path = vim.fn.stdpath("data") .. "/language-servers/jdt-language-server"
local launcher_jar = vim.fn.glob(jdtls_path .. "/plugins/org.eclipse.equinox.launcher_*.jar")
local workspace_dir = vim.fn.fnamemodify(vim.fn.getcwd(), ":p:h:t")

-- for completions
local client_capabilities = vim.lsp.protocol.make_client_capabilities()
local capabilities = cmp_nvim_lsp.default_capabilities(client_capabilities)

local function get_config_dir()
	-- Unlike some other programming languages (e.g. JavaScript)
	-- lua considers 0 truthy!
	if vim.fn.has("linux") == 1 then
		return "config_linux"
	elseif vim.fn.has("mac") == 1 then
		return "config_mac"
	else
		return "config_win"
	end
end

local config = {
	capabilities = capabilities,

	cmd = { vim.fn.expand("~/.local/share/nvim/mason/bin/jdtls") },

	settings = {
		java = {
			autobuild = {
				enabled = false,
			},
		},
		["java.format.settings.url"] = vim.fn.expand("~/formatter.xml"),
	},

	root_dir = vim.fs.dirname(vim.fs.find({ "pom.xml", ".git" }, { upward = true })[1]),

	init_options = {
		extendedClientCapabilities = jdtls.extendedClientCapabilities,
		bundles = {
			vim.fn.glob(
				"/Users/suvasanketrout/.local/share/nvim/mason/packages/java-debug-adapter/extension/server/com.microsoft.java.debug.plugin-*.jar",
				1
			),
		},
	},

	on_attach = function(client, bufnr)
		require("jdtls.dap").setup_dap_main_class_configs()

		local opts = { silent = true, buffer = bufnr }
		local map = vim.keymap.set

		map("n", "gD", vim.lsp.buf.declaration, opts)
		map("n", "gi", vim.lsp.buf.implementation, opts)
		map("n", "gd", "<cmd>Lspsaga goto_definition<cr>", opts)
		map("n", "gr", "<cmd>Lspsaga finder<cr>", opts)
		map("n", "gtd", "<cmd>Lspsaga goto_type_definition<cr>", opts)
		map("n", "K", "<cmd>Lspsaga hover_doc<cr>", opts)
		map("n", "<leader>k", vim.lsp.buf.signature_help, opts)

		map("n", "<leader>coi", jdtls.organize_imports, { desc = "Organize imports", buffer = bufnr })
		map("n", "<leader>ctc", jdtls.test_class, { desc = "test class", buffer = bufnr })
		map("n", "<leader>ctm", jdtls.test_nearest_method, { desc = "test method", buffer = bufnr })
		map("n", "<leader>cev", jdtls.extract_variable_all, { desc = "Extract variable", buffer = bufnr })
		map(
			"v",
			"<leader>cem",
			[[<ESC><CMD>lua require('jdtls').extract_method(true)<CR>]],
			{ desc = "Extract method", buffer = bufnr }
		)
		map("n", "<leader>cec", jdtls.extract_constant, { desc = "Extract constant", buffer = bufnr })
	end,
}

jdtls.start_or_attach(config)
