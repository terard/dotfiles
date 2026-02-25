return {
	"vim-test/vim-test",
	--dependencies = {
	--"preservim/vimux",
	--},
	config = function()
		--vim.keymap.set("n", "<leader>t", ":TestFile<CR>", {})
		vim.keymap.set("n", "<leader>t", ":silent! wall | TestFile<CR>", {})
		--vim.keymap.set("n", "<leader>T", ":TestFile<CR>", {})
		--vim.keymap.set("n", "<leader>a", ":TestSuite<CR>", {})
		--vim.keymap.set("n", "<leader>l", ":TestLast<CR>", {})
		--vim.keymap.set("n", "<leader>g", ":TestVisit<CR>", {})
		--vim.cmd("let test#strategy = 'vimux'")
		--vim.cmd("let g:test#preserve_screen = 0")
		--vim.cmd("let test#autowrite = 1")
		--vim.cmd("let autowrite = 1")
		--vim.cmd("let autowriteall = 1")
		--vim.cmd("let autowrite")
		--vim.cmd("let autowriteall")
	end,
}
