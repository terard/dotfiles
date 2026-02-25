local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
	vim.fn.system({
		"git",
		"clone",
		"--filter=blob:none",
		"https://github.com/folke/lazy.nvim.git",
		"--branch=stable", -- latest stable release
		lazypath,
	})
end
vim.opt.rtp:prepend(lazypath)

vim.g.mapleader = "," -- Make sure to set `mapleader` before lazy so your mappings are correct

require("lazy").setup("plugins")

vim.cmd.colorscheme("catppuccin-frappe")

--vim.diagnostic.config
vim.diagnostic.config({
  virtual_text = true, -- Shows error message at the end of the line
  underline = true,    -- The "red squiggle" equivalent
  update_in_insert = false, -- Only update after leaving insert mode to reduce noise
  severity_sort = true,
})

require("travhimself")
--require("avante_lib").load()
--require("oil").setup()
--print("hello from init")
