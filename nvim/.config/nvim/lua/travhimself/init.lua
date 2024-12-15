--print("hello from travhimself")
require("travhimself.options")
require("travhimself.remap")
require("travhimself.ruby")

local autocmd = vim.api.nvim_create_autocmd
vim.cmd("source ~/.config/nvim/lua/travhimself/legacy.vim")

autocmd({ "BufWritePre" }, {
	pattern = { "*" },
	command = [[%s/\s\+$//e]],
})

autocmd("TextYankPost", {
	callback = function()
		vim.highlight.on_yank({ higroup = "Visual", timeout = 300 })
	end,
})

autocmd("CursorHold", { pattern = "*", command = "checktime" })

vim.g.netrw_browse_split = 0
vim.g.netrw_banner = 0
vim.g.netrw_winsize = 25
