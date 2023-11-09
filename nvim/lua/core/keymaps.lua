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
map({ "i", "c" }, "<C-h>", "<left>")
map({ "i", "c" }, "<C-l>", "<right>")
map("i", "<C-j>", "<down>")
map("i", "<C-k>", "<up>")

-- Beginning and end of line in `:` command mode
map("c", "<C-a>", "<home>")
map("c", "<C-e>", "<end>")

--buffer
map("n","<leader>-",cmd("split"))
map("n","<leader>|",cmd("vsplit"))
map("t", "<C-[>", "<C-\\><C-n>")
map("n", "<leader>bf", "gg=G<C-o>", { desc = "buffer format" })
map("n", "]b", cmd("bnext!"))
map("n", "[b", cmd("bprevious!"))
map("n", "[ob", cmd("set showtabline=2"), { desc = "showtabline" })
map("n", "]ob", cmd("set showtabline=0"), { desc = "disabletabline" })

--git
map(
	"n",
	"<leader>gl",
	'<cmd>lcd%:p:h<cr><cmd>lua require("lazy.util").float_term({ "lazygit" }, { interactive = true })<cr>',
	{ desc = "lazygit" }
)
map("n", "<leader>gr", function()
	local user_input = vim.fn.input("url:")
	vim.cmd("G remote add origin " .. user_input)
end, { desc = "git add remote" })

--helix
map({ "n", "x" }, "gl", "$")
map({ "n", "x" }, "gh", "^")

--smart-dele
map("n", "dd", function()
	local line_data = vim.api.nvim_win_get_cursor(0)
	local current_line = vim.api.nvim_buf_get_lines(0, line_data[1] - 1, line_data[1], false)
	if current_line[1] == "" then
		return '"_dd'
	else
		return "dd"
	end
end, { expr = true })

map("n", "cc", function()
	local line_data = vim.api.nvim_win_get_cursor(0)
	local current_line = vim.api.nvim_buf_get_lines(0, line_data[1] - 1, line_data[1], false)
	if current_line[1] == "" then
		return '"_cc'
	else
		return "cc"
	end
end, { expr = true })

--smart-ai
map("n", "i", function()
	if vim.api.nvim_get_current_line():match("^%s*$") then
		return "cc"
	else
		return "i"
	end
end, { expr = true })
map("n", "a", function()
	if vim.api.nvim_get_current_line():match("^%s*$") then
		return "cc"
	else
		return "a"
	end
end, { expr = true })

-- keep visual selection when (de)indenting
map("v", "<", "<gv", {})
map("v", ">", ">gv", {})

-- Select last pasted/yanked text
map("n", "gV", "`[v`]", { desc = "visual select last yank/paste" })

-- Search and Replace
map("n", "c.", [[:%s/\<<C-r><C-w>\>//g<Left><Left>]], { desc = "search and replace word under cursor" })
map("n", "c>", [[:%s/\V<C-r><C-a>//g<Left><Left>]], { desc = "search and replace WORD under cursor" })
map("x", "c.", [[:<C-u>%s/\V<C-r>=luaeval("require'utils'.get_visual_selection(true)")<CR>//g<Left><Left>]])
