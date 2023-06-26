vim.opt.guicursor = ""

--vim.opt.autochdir = true

vim.opt.nu = true
vim.opt.relativenumber = true

vim.opt.tabstop = 2
vim.opt.softtabstop = 2
vim.opt.shiftwidth = 2
vim.opt.expandtab = true

vim.opt.smartindent = true
vim.opt.autoindent = true

vim.opt.wrap = false

vim.opt.swapfile = false
vim.opt.backup = false
vim.opt.undodir = os.getenv("HOME") .. "/.vim/undodir"
vim.opt.undofile = true

--vim.opt.hlsearch = false
vim.opt.incsearch = true

vim.opt.showmatch = true
vim.opt.cursorline = true

vim.opt.termguicolors = true

vim.opt.autoread = true

vim.opt.scrolloff = 8
vim.opt.signcolumn = "yes"
vim.opt.isfname:append("@-@")

vim.opt.updatetime = 50

vim.opt.colorcolumn = "80"

vim.opt.mouse = ""

-- from old config
--vim.opt.pastetoggle = "<F2>"
vim.opt.clipboard = "unnamed"
--vim.opt.clipboard = "unnamed"
--set clipboard+=unnamedplus

vim.g.mapleader = ","

--vim.g.neoterm_size = tostring(0.3 * vim.o.columns)
--vim.g.neoterm_default_mod = 'botright vertical'
--vim.g.neoterm_autoinsert = 1
--vim.g.neoterm_keep_term_open = 0

--vim.test.neovim.term_position = "vert botright 30"
--let test#neovim#term_position = "topleft"
--let test#neovim#term_position = "vert"
--let test#neovim#term_position = "vert botright 30"
