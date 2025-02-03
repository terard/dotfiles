return {
	"stevearc/oil.nvim",
	enabled = true,
	---@module 'oil'
	---@type oil.SetupOpts
	opts = {},
	-- Optional dependencies
	dependencies = { { "echasnovski/mini.icons", opts = {} } },
	-- dependencies = { "nvim-tree/nvim-web-devicons" }, -- use if prefer nvim-web-devicons
	config = function()
		vim.keymap.set("n", "<leader>d", "<CMD>Oil<CR>", { desc = "Open parent directory" })
		require("oil").setup({
			columns = { "icon" },
			keymaps = {
				["<C-p>"] = false,
			},
			view_options = {
				show_hidden = true,
			},
		})
	end,
}
