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

--HghLight
autocmd("VimEnter", {
	pattern = "*",
	callback = function()
		hl("SagaLightBulb", { fg = "#FFD93D" })
		hl("SagaBeacon", { bg = "#29a4bd" })
		hl("LspSagaFinderSelection", { fg = "#61677A" })
		-- hl("CursorLine", { blend = 3 })
		hl("Folded", { fg = "#7D7C7C" })
		hl("NeogitFold", { bg = "NONE" })
		hl("Search", { bg = "#4F4557" })
		hl("IlluminatedWordText", { link = "Visual" })
		hl("IlluminatedWordRead", { link = "Visual" })
		hl("IlluminatedWordWrite", { link = "Visual" })
		hl("hlyank", { bg = "#FF9B50" })
		hl("SignColumn", { fg = "NONE" })
		hl("lualine_a_normal", { bold = true })
	end,
})

--highlight yank
autocmd("TextYankPost", {
	pattern = "*",
	callback = function()
		vim.highlight.on_yank({ higroup = "hlyank", timeout = 100 })
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
		"fugitive",
		"crunner",
		"qf",
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

--nvim tree autoclose
local function tab_win_closed(winnr)
local api = require"nvim-tree.api"
local tabnr = vim.api.nvim_win_get_tabpage(winnr)
local bufnr = vim.api.nvim_win_get_buf(winnr)
local buf_info = vim.fn.getbufinfo(bufnr)[1]
local tab_wins = vim.tbl_filter(function(w) return w~=winnr end, vim.api.nvim_tabpage_list_wins(tabnr))
local tab_bufs = vim.tbl_map(vim.api.nvim_win_get_buf, tab_wins)
if buf_info.name:match(".*NvimTree_%d*$") then            -- close buffer was nvim tree
  -- Close all nvim tree on :q
  if not vim.tbl_isempty(tab_bufs) then                      -- and was not the last window (not closed automatically by code below)
    api.tree.close()
  end
else                                                      -- else closed buffer was normal buffer
  if #tab_bufs == 1 then                                    -- if there is only 1 buffer left in the tab
    local last_buf_info = vim.fn.getbufinfo(tab_bufs[1])[1]
    if last_buf_info.name:match(".*NvimTree_%d*$") then       -- and that buffer is nvim tree
      vim.schedule(function ()
	if #vim.api.nvim_list_wins() == 1 then                -- if its the last buffer in vim
	  vim.cmd "Alpha"                                        -- then close all of vim
	else                                                  -- else there are more tabs open
	  vim.api.nvim_win_close(tab_wins[1], true)             -- then close only the tab
	end
      end)
    end
  end
end
end
autocmd("WinClosed", {
callback = function ()
  local winnr = tonumber(vim.fn.expand("<amatch>"))
  vim.schedule_wrap(tab_win_closed(winnr))
end,
nested = true
})

autocmd("TermOpen",{
	pattern = "*",
	callback = function()
		vim.cmd"setlocal listchars= nonumber norelativenumber"
	end
})
