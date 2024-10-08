return {
	"theprimeagen/harpoon",
	config = function()
		local mark = require("harpoon.mark")
		local ui = require("harpoon.ui")

		--vim.keymap.set("n", "<leader>at", mark.add_file)
		vim.keymap.set("n", "<leader>a", mark.toggle_file)
		vim.keymap.set("n", "<leader>ac", mark.clear_all)
		vim.keymap.set("n", "<C-e>", ui.toggle_quick_menu)

		--vim.keymap.set("n", "<S-C-M-S-1>", function() ui.nav_file(1) end)
		-- this would bork my pane navigation
		--vim.keymap.set("n", "<C-h>", function() ui.nav_file(1) end)

		vim.keymap.set("n", "<leader>1", function()
			ui.nav_file(1)
		end)
		vim.keymap.set("n", "<leader>2", function()
			ui.nav_file(2)
		end)
		vim.keymap.set("n", "<leader>3", function()
			ui.nav_file(3)
		end)
		vim.keymap.set("n", "<leader>4", function()
			ui.nav_file(4)
		end)
		vim.keymap.set("n", "<leader>5", function()
			ui.nav_file(5)
		end)
		vim.keymap.set("n", "<leader>6", function()
			ui.nav_file(6)
		end)
		vim.keymap.set("n", "<leader>7", function()
			ui.nav_file(7)
		end)
		vim.keymap.set("n", "<leader>8", function()
			ui.nav_file(8)
		end)
		vim.keymap.set("n", "<leader>9", function()
			ui.nav_file(9)
		end)
		vim.keymap.set("n", "<leader>0", function()
			ui.nav_file(10)
		end)
	end,
}
