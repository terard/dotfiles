print("hello from travhimself")
require("travhimself.options")
require("travhimself.remap")
require("travhimself.ruby")

vim.cmd("source ~/.config/nvim/lua/travhimself/legacy.vim")

vim.api.nvim_create_autocmd({ "BufWritePre" }, {
  pattern = { "*" },
  command = [[%s/\s\+$//e]],
})
