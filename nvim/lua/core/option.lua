require("core.autocmd")
local o = vim.opt
local c = vim.cmd
local create_command = vim.api.nvim_create_user_command

--create command
create_command("RunCodeEdit", "e ~/.config/nvim/lua/plugins/code_run.lua", {})
create_command("LspSettings", "e ~/.config/nvim/lua/core/lsp.lua", {})
create_command("CmpEnable", "lua require('cmp').setup.buffer { enabled = true }", {})
create_command("CmpDisable", "lua require('cmp').setup.buffer { enabled = false }", {})

-- Fix common typos
c([[
    cnoreabbrev W! w!
    cnoreabbrev W1 w!
    cnoreabbrev w1 w!
    cnoreabbrev Q! q!
    cnoreabbrev Q1 q!
    cnoreabbrev q1 q!
    cnoreabbrev Qa! qa!
    cnoreabbrev Qall! qall!
    cnoreabbrev Wa wa
    cnoreabbrev Wq wq
    cnoreabbrev wQ wq
    cnoreabbrev WQ wq
    cnoreabbrev wq1 wq!
    cnoreabbrev Wq1 wq!
    cnoreabbrev wQ1 wq!
    cnoreabbrev WQ1 wq!
    cnoreabbrev W w
    cnoreabbrev Q q
    cnoreabbrev Qa qa
    cnoreabbrev Qall qall
]])

--appearance
c("colorscheme rose-pine")
o.termguicolors = true
o.signcolumn = "yes"
o.hlsearch = false
o.fillchars = "fold: ,eob: "

--fold
o.foldmethod = "manual"
o.foldtext = [[substitute(getline(v:foldstart),'\\t',repeat('\ ',&tabstop),'g').' .. '.trim(getline(v:foldend)) ]]
o.foldnestmax = 3
o.foldminlines = 1

--netrw
vim.g.did_load_netrw = 0

--some op options
o.swapfile = false
o.backup = false
o.undodir = os.getenv("HOME") .. "/dev/undodir"
o.undofile = true
o.updatetime = 50
o.autochdir = false

--line number
o.relativenumber = true
o.number = true
o.cursorline = true

--tab indent
o.tabstop = 4
o.softtabstop = 4
o.wrap = false
o.list = false

--search
o.ignorecase = true
o.smartcase = true

--backsapce
o.backspace = "indent,eol,start"

--clipboard
o.clipboard:append("unnamedplus")

--split
o.splitright = true
o.splitbelow = true
o.splitkeep = "screen"

o.iskeyword:append("-")

--scrolloff
o.scrolloff = 17

--indent
o.autoindent = true
o.smartindent = true

--format
o.formatexpr = "v:lua.require'conform'.formatexpr()"

--status line
o.laststatus = 0
o.ruler = false