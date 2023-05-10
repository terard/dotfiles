require("travhimself.packer")
require("travhimself.set")
require("travhimself.remap")
--require("travhimself.emmet")
require("travhimself.ruby")

vim.cmd("source ~/.config/nvim/lua/travhimself/legacy.vim")
--vim.cmd 'source ~/.config/nvim/keymaps.vim'
--print("hello from travhimself")

vim.api.nvim_create_autocmd({ "BufWritePre" }, {
  pattern = { "*" },
  command = [[%s/\s\+$//e]],
})
