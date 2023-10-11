local autocmd = vim.api.nvim_create_autocmd
local augroup = vim.api.nvim_create_augroup
local hl = function(name, val, id)
	local defaultid = 0
	if id then
		defaultid = id
	end
	vim.api.nvim_set_hl(defaultid, name, val)
end
local yank = augroup("yank", { clear = true })

--HghLight--
autocmd("VimEnter", {
	pattern = "*",
	callback = function()
		hl("SagaLightBulb", { fg = "#FFD93D" })
		hl("SagaBeacon", { bg = "#29a4bd" })
		hl("Visual", { bg = "#4F4557", fg = "#D5B4B4" })
		hl("LspSagaFinderSelection", { fg = "#61677A" })
		hl("CursorLineNr", { fg = "#FF9B50" })
		hl("CursorLine", { blend = 12 })
		hl("TelescopeBorder", { fg = "#A8A196", bold = true })
		hl("Folded", { fg = "#7D7C7C" })
		hl("VertSplit", { fg = "#FFC6AC" })
		hl("NeogitFold", { bg = "NONE" })
	end,
})

--highlight yank
autocmd("TextYankPost", {
	pattern = "*",
	callback = function()
		vim.highlight.on_yank({ higroup = "Visual", timeout = 60 })
	end,
	group = yank,
})

-- Persistent Folds
local save_fold = augroup("Persistent Folds", { clear = true })
autocmd("BufWinLeave", {
	pattern = "*.*",
	callback = function()
		vim.cmd.mkview()
	end,
	group = save_fold,
})
autocmd("BufWinEnter", {
	pattern = "*.*",
	callback = function()
		vim.cmd.loadview({ mods = { emsg_silent = true } })
	end,
	group = save_fold,
})

-- Use 'q' to quit from common plugins
autocmd("FileType", {
	pattern = {
		"help",
		"man",
		"lspinfo",
		"trouble",
		"crunner",
	},
	callback = function(event)
		vim.opt_local.wrap = false
		vim.bo[event.buf].buflisted = false
		vim.keymap.set("n", "q", "<cmd>close<cr>", { buffer = event.buf, silent = true })
	end,
})

-- Persistent Cursor
autocmd("BufReadPost", {
	callback = function()
		local mark = vim.api.nvim_buf_get_mark(0, '"')
		local lcount = vim.api.nvim_buf_line_count(0)
		if mark[1] > 0 and mark[1] <= lcount then
			pcall(vim.api.nvim_win_set_cursor, 0, mark)
		end
	end,
})

--hot reload
autocmd("BufWritePost", {
	pattern = "*.lua",
	callback = function()
		vim.cmd.source()
	end,
})

--no auto comment
autocmd("FileType", {
	pattern = "*",
	callback = function()
		vim.cmd("setlocal formatoptions-=c formatoptions-=r formatoptions-=o")
	end,
})
