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
map("n", "<leader>t", "<cmd>15 split term://zsh<cr>i")
map("i", "<M-BS>", "<C-W>")
map("n", "<tab>", "za")
map("n", "zx", cmd("bd!"))
map("n", "<leader>ww", cmd("noa w!"), { desc = "save withoutformat" })
map("n", "<leader>cd", cmd("lcd%:p:h<cr>:echo 'current dir is now ' . getcwd()"), { desc = "cd" })

-- Beginning and end of line in `:` command mode
map("c", "<C-a>", "<home>")
map("c", "<C-e>", "<end>")

--quit
map("t", "<C-[>", "<C-\\><C-n>")
map("v", "<C-c>", "<ESC>")

--split
map("n", "<leader>-", "<C-w>s", { desc = "split-" })
map("n", "<leader>|", "<C-w>v", { desc = "split|" })
map("n", "<leader>=", "<C-w>=", { desc = "split=" })
map("n", "<leader>m", "<C-w>_<C-w>|", { desc = "split max" })

--runner
map("v", "<leader>rc", cmd("SnipRun"), { desc = "RunSelectedCode" })
map("n", "<leader>rC", cmd("SnipClose"), { desc = "SnipClose" })

--git
map("n", "<leader>gs", cmd("Gitsigns stage_buffer"))
map("n", "<leader>g0", cmd("Gitsigns reset_buffer_index"))
map("n", "<leader>ga", cmd("Gitsigns toggle_current_line_blame"))
map(
	"n",
	"<leader>gl",
	'<cmd>lcd%:p:h<cr><cmd>lua require("lazy.util").float_term({ "lazygit" }, { interactive = true })<cr>',
	{ desc = "lazygit" }
)

--helix
map("n", "gl", "$")
map("n", "gh", "^")

--smart-dd
map("n", "dd", function()
	local line_data = vim.api.nvim_win_get_cursor(0)
	local current_line = vim.api.nvim_buf_get_lines(0, line_data[1] - 1, line_data[1], false)
	if current_line[1] == "" then
		return '"_dd'
	else
		return "dd"
	end
end, { expr = true })

--smart-a
map("n", "a", function()
	if vim.api.nvim_get_current_line():match("^%s*$") then
		return "dd<Up>o"
	else
		return "a"
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
