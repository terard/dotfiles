return {
	-- the colorscheme should be available when starting Neovim
	{
		--"folke/tokyonight.nvim",
		"catppuccin/nvim",
		name = "catppuccin",
		lazy = false, -- make sure we load this during startup if it is your main colorscheme
		priority = 1000, -- make sure to load this before all the other start plugins
		config = function()
			-- load the colorscheme here
			--vim.cmd([[colorscheme tokyonight]])
			vim.cmd.colorscheme("catppuccin-mocha")
			--vim.cmd.colorscheme "catppuccin"
		end,
	},
}

--return {
--"uloco/bluloco.nvim",
--lazy = false,
--priority = 1000,
--dependencies = { "rktjmp/lush.nvim" },
--config = function()
--require("bluloco").setup({
--style = "dark", -- "auto" | "dark" | "light"
--transparent = false,
--italics = false,
--terminal = vim.fn.has("gui_running") == 1, -- bluoco colors are enabled in gui terminals per default.
--guicursor = true,
--})
--end,
--}

--return {
--{
--"craftzdog/solarized-osaka.nvim",
--branch = "osaka",
--lazy = false,
--priority = 1000,
--opts = function()
--return {
--transparent = false,
--}
--end,
--},
--}
