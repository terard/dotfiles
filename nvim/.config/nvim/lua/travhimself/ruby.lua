--local capabilities = vim.lsp.protocol.make_client_capabilities()
--local format = vim.lsp.buf.format(
--{
--defaultFormatter = {
--"rubocop"
--},
--}
--)

--require "lspconfig".ruby_ls.setup({
----format = format,
--defaultFormatter = "rubocop",
--defaultFormattingProvider = "rubocop",
--init_options = {
--defaultFormatter = "rubocop",
--formatter = "rubocop",
--format = "rubocop"
--}
--})
--print("hello from ruby_ls")

vim.opt.signcolumn = "yes" -- otherwise it bounces in and out, not strictly needed though
vim.api.nvim_create_autocmd("FileType", {
  pattern = "ruby",
  group = vim.api.nvim_create_augroup("RubyLSP", { clear = true }), -- also this is not /needed/ but it's good practice
  callback = function()
    vim.lsp.start {
      name = "standard",
      cmd = { "/Users/september/.gem/ruby/3.2.2/bin/standardrb", "--lsp" },
    }
  end,
})

--vim.api.nvim_create_autocmd("FileType", {
  --pattern = "eruby",
  ----group = vim.api.nvim_create_augroup("RubyLSP", { clear = true }), -- also this is not /needed/ but it's good practice
  --callback = function()
    --vim.schedule(function()
      --print("woo")
    --end)
    --vim.lsp.start {
      --name = "erblint",
      --cmd = { "/Users/september/.gem/ruby/3.2.2/bin/erblint", "--lsp" },
    --}
  --end,
--})
