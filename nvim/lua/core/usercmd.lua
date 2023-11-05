---@diagnostic disable: lowercase-global
local create_command = vim.api.nvim_create_user_command
cwd = vim.fn.expand("%:p:h")
file = vim.fn.expand("%:t")
filewe = vim.fn.expand("%:t:r")

function term(cmd)
	local ter = table.concat({ "split | resize 15 | term ", cmd })
	vim.cmd(ter)
end
function sh(cmd)
	local zhs = table.concat({ "!", cmd })
	vim.cmd(zhs)
end
--misc
create_command("LspSettings", "e ~/.config/nvim/lua/core/lsp.lua", {})
create_command("CmpEnable", "lua require('cmp').setup.buffer { enabled = true }", {})
create_command("CmpDisable", "lua require('cmp').setup.buffer { enabled = false }", {})

----scripts----
--[[
	1.in scripts name of the script
	2.make a function to be execute if selected the script name
	3.call the script within a if statement
	*term() for execute in term
	*sh() for execute in sh in backend
]]

scripts = { "javac", "clang" }

function javac()
	local cwd = vim.fn.expand("%:p:h")
	local file = vim.fn.expand("%:t")
	local filewe = vim.fn.expand("%:t:r")

	local shit = "cd " .. cwd .. " && javac " .. file .. " && java " .. filewe .. " && rm " .. filewe .. ".class"
	term(shit)
end
function clang()
	local filename = vim.fn.expand("%:t")
	local filenamewt = vim.fn.expand("%:t:r")
	sh("clang --debug " .. filename .. " -o " .. filenamewt)
end

--run
create_command("Run", function()
	vim.ui.select(scripts, {
		prompt = "Select tabs or spaces:",
		format_item = function(item)
			return "run " .. item
		end,
	}, function(choice)
		----scripts call----
		if choice == "javac" then
			javac()
		elseif choice == "clang" then
			clang()
		else
			vim.cmd("echo'ran nothing'")
		end
	end)
end, {})
