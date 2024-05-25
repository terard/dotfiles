local function is_git_repo()
  local is_repo = vim.fn.system("git rev-parse --is-inside-work-tree")

  return vim.v.shell_error == 0
end

vim.keymap.set("n", "<leader>gs", function()
  if is_git_repo() then
    vim.cmd("Git")
  else
    print("this is not a git repo, man.")
  end
end)
