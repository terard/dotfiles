return {
	"nvim-telescope/telescope.nvim",
	tag = "0.1.6", -- or , branch = '0.1.x',
	dependencies = { "nvim-lua/plenary.nvim" },
	config = function()
		--require("telescope").setup({})

		local builtin = require("telescope.builtin")
		--vim.keymap.set("n", "<leader>pf", builtin.find_files, {})
		--vim.keymap.set("n", "<C-p>", builtin.git_files, {})
		vim.keymap.set("n", "<C-p>", builtin.find_files, {})

		--vim.keymap.set("n", "<leader>pws", function()
		--local word = vim.fn.expand("<cword>")
		--builtin.grep_string({ search = word })
		--end)

		vim.keymap.set("n", "<leader>ps", function()
			builtin.grep_string({ search = vim.fn.input("Grep > ") })
		end)

		local actions = require("telescope.actions")
		require("telescope").setup({
			defaults = {
				mappings = {
					i = {
						["<esc>"] = actions.close,
					},
				},
			},
		})
	end,
}
