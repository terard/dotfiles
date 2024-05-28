vim.keymap.set("n", "<leader>d", vim.cmd.Ex)
--vim.keymap.set("n", "<cr>", vim.cmd.Ex)

vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")

vim.keymap.set("n", "J", "mzJ`z")
vim.keymap.set("n", "<C-d>", "<C-d>zz")
vim.keymap.set("n", "<C-u>", "<C-u>zz")

vim.keymap.set("n", "n", "nzzzv")
vim.keymap.set("n", "N", "Nzzzv")

--vim.keymap.set("x", "<leader>p", '"_dP')

--vim.keymap.set("n", "<leader>y", "\"+y")
--vim.keymap.set("v", "<leader>y", "\"+y")
--vim.keymap.set("n", "<leader>Y", "\"+Y")

vim.keymap.set("i", "<C-C>", "<Esc>")

vim.keymap.set("n", "Q", "<nop>")
vim.keymap.set("n", "<C-f>", "<cmd>silent !tmux neww tmux-sessionizer<CR>")

--vim.keymap.set("n", "<leader>f", function()
--require("conform").format({ async = true, lsp_fallback = true })
--end)

--vim.keymap.set("n", "<leader>f", function()
--vim.lsp.buf.format()
--end)
--vim.keymap.set("n", "<Leader>f", ":ErbLint --autocorrect<CR>")

vim.keymap.set("n", "<leader>x", "<cmd>!chmod +x %<CR>", { silent = true })

-- gangster setup: run raw dog like this if no pry
--vim.keymap.set("n", "<leader>t", ":!rspec %<cr>")
-- AND run like this if there is a pry
--vim.keymap.set("n", "<leader>t", ":T{:botright :vertical} rspec %<cr>")
--vim.keymap.set("n", "<cr>", ":T rspec %<cr>")
--vim.keymap.set("n", "<cr>", ":terminal rspec %<cr>")

--vim.keymap.set("n", "<leader>t", ":TestFile -strategy=neoterm<CR>")
--vim.keymap.set("n", "<leader>t", ":TestFile -strategy=basic<CR>")
--vim.keymap.set("n", "<leader>t", ":TestFile -strategy=harpoon<CR>")
vim.keymap.set("n", "<leader>t", function()
	vim.api.nvim_command("write")
	vim.cmd("TestFile -strategy=basic")
end)

--nnoremap
--vim.keymap.set("n", "<leader><CR>", ":so $XDG_CONFIG_HOME/nvim/init.vim<CR>")
vim.keymap.set("n", "<leader><CR>", ":so $XDG_CONFIG_HOME/nvim/init.lua<CR>")
--vim.keymap.set("n", "<leader><CR>", ":so /Users/atomic/.config/nvim/init.lua<CR>")

--vim.keymap.set("t", "<Esc>", "<C-\"><C-n>")
vim.keymap.set("t", "<C-j>", '<C-"><C-n><C-w>j')
vim.keymap.set("t", "<C-k>", '<C-"><C-n><C-w>k')
vim.keymap.set("t", "<C-h>", '<C-"><C-n><C-w>h')
vim.keymap.set("t", "<C-l>", '<C-"><C-n><C-w>l')

-- copied from old config
vim.keymap.set("n", "<C-j>", "<C-w>j")
vim.keymap.set("n", "<C-k>", "<C-w>k")
vim.keymap.set("n", "<C-h>", "<C-w>h")
vim.keymap.set("n", "<C-l>", "<C-w>l")

--vim.keymap.set("n", "<leader><leader>", "<c-^>")
--vim.keymap.set("n", "<leader><leader>", ":bprevious<cr>")
vim.keymap.set("n", "<leader><leader>", ":e#<cr>")

--nnoremap <Leader><CR> :so $XDG_CONFIG_HOME/nvim/init.vim<CR>gg
