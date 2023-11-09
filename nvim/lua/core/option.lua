local o = vim.opt
local c = vim.cmd

-- Fix common typos
--{{{
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
    cnoreabbrev GW Gw
    cnoreabbrev Qall qall
]])
--}}}

--appearance
vim.cmd.colorscheme("rose-pine")
o.termguicolors = true
o.signcolumn = "auto"
o.hlsearch = false
o.fillchars = {
	fold = " ",
	eob = " ",
}
o.listchars = {
	tab = "│  ",
	eol = "󱞥",
	-- trail = "-",
	-- nbsp = "+",
}

--fold
o.foldmethod = "manual"
--{{{
c([[
function! GetSpaces(foldLevel)
    if &expandtab == 1
        " Indenting with spaces
        let str = repeat(" ", a:foldLevel / (&shiftwidth + 1) - 1)
        return str
    elseif &expandtab == 0
        " Indenting with tabs
        return repeat(" ", indent(v:foldstart) - (indent(v:foldstart) / &shiftwidth))
    endif
endfunction

function! MyFoldText()
    let startLineText = getline(v:foldstart)
    let endLineText = trim(getline(v:foldend))
    let indentation = GetSpaces(foldlevel("."))
    let spaces = repeat(" ", 200)

    let str = indentation . startLineText . " .. " . endLineText

    return str
endfunction

" Custom display for text when folding
set foldtext=MyFoldText()]])
--}}}
o.foldnestmax = 3
o.foldminlines = 1

--netrw
vim.g.did_load_netrw = 0

--some op options
o.swapfile = false
o.backup = false
o.undodir = os.getenv("HOME") .. "/dev/undodir"
o.viewdir = os.getenv("HOME") .. "/dev/vim_ses"
o.undofile = true
o.updatetime = 50
o.autochdir = true

--line and cursor
o.relativenumber = true
o.number = true
o.cursorline = true
o.guicursor = "n-v-c-i-sm:block,ci-ve:ver25,r-cr-o:hor20"

--tab indent
o.tabstop = 4
o.shiftwidth = 4
o.softtabstop = 4
o.wrap = false
o.list = false
o.expandtab = true

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
o.smartindent = false

--format
o.formatexpr = "v:lua.require'conform'.formatexpr()"

--status line
o.laststatus = 0
o.ruler = false

--conceal
o.conceallevel = 2
-- o.concealcursor = "n"

o.hidden = true

--tabline
o.showtabline = 0

o.sessionoptions = "buffers,curdir,folds,help,tabpages,winsize,winpos,terminal,localoptions"

vim.g.pasta_disabled_filetypes = { "fugitive" }
