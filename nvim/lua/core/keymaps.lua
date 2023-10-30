local function map(mode, lhs, rhs, opts)
	local options = { noremap = true, silent = true }
	if opts then
		options = vim.tbl_extend("force", options, opts)
	end
	vim.keymap.set(mode, lhs, rhs, options)
end

local function cmd(command)
	return table.concat({ "<Cmd>", command, "<CR>" })
end

--general
map("n", "<tab>", "za")
map("n", "<S-tab>", "zi")
map("n", "<leader>bc", cmd("lcd%:p:h<cr>:echo 'current dir is now ' . getcwd()"), { desc = "cd_to_current_buffer" })
map("n", "<leader>bC", ":e ~/.config/nvim/ftplugin/<C-R>=&filetype<CR>.lua<CR>", { desc = "ftplugin" })

--mac
map("i", "<M-BS>", "<C-W>")
map("i", "<D-BS>", "<C-U>")
map("n", "<D-`>", "<C-o>")
map("n", "<S-D-`>", "<C-i>")

--insert
map("i", "<C-h>", "<left>")
map("i", "<C-j>", "<down>")
map("i", "<C-k>", "<up>")
map("i", "<C-l>", "<right>")

-- Beginning and end of line in `:` command mode
map("c", "<C-a>", "<home>")
map("c", "<C-e>", "<end>")

--buffer
-- map("n", "zx", function()
-- 	if #vim.fn.getbufinfo({ buflisted = 1 }) == 1 then
-- 		vim.cmd("Alpha")
-- 		vim.cmd("bdelete! #")
-- 	else
-- 		-- vim.cmd.w()
-- 		vim.cmd.bdelete()
-- 	end
-- end)
map("t", "<C-[>", "<C-\\><C-n>")
map("n", "<leader>bf", "gg=G<C-o>", { desc = "buffer format" })
map("n", "<C-t>", cmd("bnext!"))
map("n", "<S-C-t>", cmd("bprevious!"))

--split
map("n", "<leader>=", "<C-w>=", { desc = "split=" })
map("n", "<leader>m", "<C-w>_<C-w>|", { desc = "split max" })

--git
map("n", "<leader>gl", '<cmd>lcd%:p:h<cr><cmd>lua require("lazy.util").float_term({ "lazygit" }, { interactive = true })<cr>', { desc = "lazygit" })
map("n", "<leader>gr", function()
	local user_input = vim.fn.input("url:")
	vim.cmd("G remote add origin " .. user_input)
end, { desc = "git add remote" })

--helix
map({ "n", "x" }, "gl", "$")
map({ "n", "x" }, "gh", "^")

--smart-dele
-- map("n", "dd", function()
-- 	local line_data = vim.api.nvim_win_get_cursor(0)
-- 	local current_line = vim.api.nvim_buf_get_lines(0, line_data[1] - 1, line_data[1], false)
-- 	if current_line[1] == "" then
-- 		return '"_dd'
-- 	else
-- 		return "dd"
-- 	end
-- end, { expr = true })
--
-- map("n", "cc", function()
-- 	local line_data = vim.api.nvim_win_get_cursor(0)
-- 	local current_line = vim.api.nvim_buf_get_lines(0, line_data[1] - 1, line_data[1], false)
-- 	if current_line[1] == "" then
-- 		return '"_cc'
-- 	else
-- 		return "cc"
-- 	end
-- end, { expr = true })

--smart-i
map("n", "i", function()
	if vim.api.nvim_get_current_line():match("^%s*$") then
		return "cc"
	else
		return "i"
	end
end, { expr = true })

-- keep visual selection when (de)indenting
map("v", "<", "<gv", {})
map("v", ">", ">gv", {})

-- Select last pasted/yanked text
map("n", "g<C-v>", "`[v`]", { desc = "visual select last yank/paste" })

-- Search and Replace
map("n", "c.", [[:%s/\<<C-r><C-w>\>//g<Left><Left>]], { desc = "search and replace word under cursor" })
map("n", "c>", [[:%s/\V<C-r><C-a>//g<Left><Left>]], { desc = "search and replace WORD under cursor" })
map("x", "c.", [[:<C-u>%s/\V<C-r>=luaeval("require'utils'.get_visual_selection(true)")<CR>//g<Left><Left>]])

local ts_repeat_move = require("nvim-treesitter.textobjects.repeatable_move")
map({ "n", "x", "o" }, ";", ts_repeat_move.repeat_last_move_next)
map({ "n", "x", "o" }, ",", ts_repeat_move.repeat_last_move_previous)
map({ "n", "x", "o" }, "f", ts_repeat_move.builtin_f)
map({ "n", "x", "o" }, "F", ts_repeat_move.builtin_F)
map({ "n", "x", "o" }, "t", ts_repeat_move.builtin_t)
map({ "n", "x", "o" }, "T", ts_repeat_move.builtin_T)
