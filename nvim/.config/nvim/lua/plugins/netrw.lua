--require("netrw").setup({})

return {
	enabled = false,
	"prichrd/netrw.nvim",
	{ "echasnovski/mini.nvim" },
	config = function()
		require("netrw").setup()
	end,
}
