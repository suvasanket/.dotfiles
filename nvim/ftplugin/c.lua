---@diagnostic disable: undefined-global
vim.api.nvim_create_user_command("Clangcompile", function()
	local filename = vim.fn.expand("%:t")
	local filenamewt = vim.fn.expand("%:t:r")
	vim.cmd("!clang --debug " .. filename .. " -o " .. filenamewt)
end, { desc = "clang debug" })
