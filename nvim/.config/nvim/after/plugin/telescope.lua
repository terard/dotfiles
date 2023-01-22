local builtin = require('telescope.builtin')
local actions = require('telescope.actions')

local function is_git_repo()
  vim.fn.system("git rev-parse --is-inside-work-tree")

  return vim.v.shell_error == 0
end

vim.keymap.set('n', '<leader>pf', builtin.find_files, {})
vim.keymap.set('n', '<C-p>', function()
  if is_git_repo() then
    return builtin.git_files()
  else
    return builtin.find_files()
  end
end)

require("telescope").setup({
  defaults = {
    mappings = {
      i = {
        ["<esc>"] = actions.close,
      },
    },
  },
})

--search not working
--vim.keymap.set('n', '<leader>ps', function()
--builtin.grep_string({ search = vim.fn.input("Grep > ") })
--end)
