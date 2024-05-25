local lsp = require('lsp-zero')
lsp.preset('recommended')

lsp.ensure_installed({
  'ruby_ls',
  --'erb_lint',
  'tsserver',
  'eslint',
  'lua_ls',
})

--local cmp = require('cmp')
----local cmp_action = require('lsp-zero').cmp_action()

--cmp.setup({
  --mapping = {
    ----['<C-n>'] = cmp_action.luasnip_jump_forward(),
    ----['<C-p>'] = cmp_action.luasnip_jump_backward(),
    --['<C-l>'] = cmp.mapping.complete(),
  --}
--})

lsp.nvim_workspace()

lsp.setup()
