local lsp = require('lsp-zero')
lsp.preset('recommended')

lsp.ensure_installed({
  --'emmet_ls',
  'ruby-lsp',
  'eslint',
  'sumneko_lua',
})

lsp.nvim_workspace()

lsp.setup()
