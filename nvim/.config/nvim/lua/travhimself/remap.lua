vim.keymap.set("n", "<leader>d", vim.cmd.Ex)
--vim.keymap.set("n", "<cr>", vim.cmd.Ex)

vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")

vim.keymap.set("n", "J", "mzJ`z")
vim.keymap.set("n", "<C-d>", "<C-d>zz")
vim.keymap.set("n", "<C-u>", "<C-u>zz")

vim.keymap.set("n", "n", "nzzzv")
vim.keymap.set("n", "N", "Nzzzv")

vim.keymap.set("x", "<leader>p", "\"_dP")

--vim.keymap.set("n", "<leader>y", "\"+y")
--vim.keymap.set("v", "<leader>y", "\"+y")
--vim.keymap.set("n", "<leader>Y", "\"+Y")

vim.keymap.set("i", "<C-C>", "<Esc>")

-- close to vim-over but not quite
--vim.keymap.set("n", "<leader>r", "hy:%s/<C-r>h//gc<left><left><left>")
--vnoremap <C-r> "hy:%s/<C-r>h//gc<left><left><left>

-- this just takes the input and runs something with it, NOT selection
--vim.keymap.set("v", "<leader>r", function()
--return ":AIEdit " .. vim.fn.input("Prompt for AI: ") .. "<cr>"
--end, { expr = true })

vim.keymap.set("n", "Q", "<nop>")
vim.keymap.set("n", "<C-f>", "<cmd>silent !tmux neww tmux-sessionizer<CR>")

vim.keymap.set("n", "<leader>f", function()
  --print("i am normal")
  vim.lsp.buf.format()
end)

-- from https://www.reddit.com/r/neovim/comments/zv91wz/range_formatting/
local range_formatting = function()
  local start_row, _ = unpack(vim.api.nvim_buf_get_mark(0, "<"))
  local end_row, _ = unpack(vim.api.nvim_buf_get_mark(0, ">"))
  vim.lsp.buf.format({
    range = {
      ["start"] = { start_row, 0 },
      ["end"] = { end_row, 0 },
    },
    async = true,
  })
end
vim.keymap.set("v", "<leader>f", range_formatting, { desc = "Range Formattin" })
-- -- --

vim.keymap.set("n", "<leader>x", "<cmd>!chmod +x %<CR>", { silent = true })

-- Git Worktrees
vim.keymap.set("n", "<leader>gwl", "[[<Cmd>lua require('telescope').extensions.git_worktree.git_worktrees()<CR>]]",
  { noremap = true, silent = true })
vim.keymap.set("n", "<leader>gwa", "[[<Cmd>lua require('telescope').extensions.git_worktree.create_git_worktree()<CR>]]",
  { noremap = true, silent = true })

-- gangster setup: run raw dog like this if no pry
--vim.keymap.set("n", "<leader>t", ":terminal rspec %<cr>a")
--vim.keymap.set("n", "<leader>t", function()
----vim.api.nvim_command("write")
----vim.cmd("terminal rspec %<cr> a")
----vim.cmd{ cmd="terminal", args = { "rspec %<cr> a" } }
--vim.cmd.terminal { args = { "rspec %" } }
--local file = vim.fn.expand("%")
--vim.cmd(file .. "<cr> a")
--end)
--vim.keymap.set("n", "<leader>t", ":w % <BAR> :terminal rspec %<cr>a")
--vim.keymap.set("n", "<leader>t", ":w % <BAR> TermExec cmd='bundle exec rspec %' direction='float' <cr>")
--vim.keymap.set("n", "<leader>t", ":w % <BAR> <Plug>PlenaryTestFile<cr>")
--vim.keymap.set("n", "<leader>t", ":w % <BAR> <Plug>PlenaryTestFile<cr>")
--nmap <leader>t <Plug>PlenaryTestFile


function _G.set_terminal_keymaps()
  local opts = { buffer = 0 }
  vim.keymap.set('t', '<esc>', [[<C-\><C-n>]], opts)
  vim.keymap.set('t', 'jk', [[<C-\><C-n>]], opts)
  vim.keymap.set('t', '<C-h>', [[<Cmd>wincmd h<CR>]], opts)
  vim.keymap.set('t', '<C-j>', [[<Cmd>wincmd j<CR>]], opts)
  vim.keymap.set('t', '<C-k>', [[<Cmd>wincmd k<CR>]], opts)
  vim.keymap.set('t', '<C-l>', [[<Cmd>wincmd l<CR>]], opts)
  vim.keymap.set('t', '<C-w>', [[<C-\><C-n><C-w>]], opts)
end

-- if you only want these mappings for toggle term use term://*toggleterm#* instead
--vim.cmd('autocmd! TermOpen term://*toggleterm#* lua set_terminal_keymaps()')
vim.cmd('autocmd! TermOpen term://* lua set_terminal_keymaps()')

-- AND run like this if there is a pry
--vim.keymap.set("n", "<leader>t", ":T{:botright :vertical} rspec %<cr>")
--vim.keymap.set("n", "<cr>", ":T rspec %<cr>")
--vim.keymap.set("n", "<cr>", ":terminal rspec %<cr>")

--vim.keymap.set("n", "<leader>t", ":TestFile -strategy=neoterm<CR>")
--vim.keymap.set("n", "<leader>t", ":TestFile -strategy=basic<CR>")
--vim.keymap.set("n", "<leader>t", ":TestFile -strategy=harpoon<CR>")

-- this is the config for vim-test:
vim.keymap.set("n", "<leader>t", function()
  vim.api.nvim_command("write")
  vim.cmd("TestFile -strategy=basic")
  --vim.cmd("TestFile -strategy=toggleterm")
  --vim.cmd("TestFile -strategy=harpoon")
end)

--vim.keymap.set("n", "<leader>t", function()
--require("neotest").run.run(vim.fn.expand("%"))
--require("neotest").output.open({ enter = true, auto_close = true })
----require("neotest").run.run(vim.fn.expand("%"))
----require("neotest").output_panel.close()
--end)

--nnoremap
--vim.keymap.set("n", "<leader><CR>", ":so $XDG_CONFIG_HOME/nvim/init.vim<CR>")
vim.keymap.set("n", "<leader><CR>", ":so $XDG_CONFIG_HOME/nvim/init.lua<CR>")
--vim.keymap.set("n", "<leader><CR>", ":so /Users/atomic/.config/nvim/init.lua<CR>")

--vim.keymap.set("t", "<Esc>", "<C-\"><C-n>")
vim.keymap.set("t", "<C-j>", "<C-\"><C-n><C-w>j")
vim.keymap.set("t", "<C-k>", "<C-\"><C-n><C-w>k")
vim.keymap.set("t", "<C-h>", "<C-\"><C-n><C-w>h")
vim.keymap.set("t", "<C-l>", "<C-\"><C-n><C-w>l")


-- copied from old config
vim.keymap.set("n", "<C-j>", "<C-w>j")
vim.keymap.set("n", "<C-k>", "<C-w>k")
vim.keymap.set("n", "<C-h>", "<C-w>h")
vim.keymap.set("n", "<C-l>", "<C-w>l")

--vim.keymap.set("n", "<leader><leader>", "<c-^>")
--vim.keymap.set("n", "<leader><leader>", ":bprevious<cr>")
vim.keymap.set("n", "<leader><leader>", ":e#<cr>")

--nnoremap <Leader><CR> :so $XDG_CONFIG_HOME/nvim/init.vim<CR>
