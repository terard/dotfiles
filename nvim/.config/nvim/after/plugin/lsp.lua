local lsp = require('lsp-zero')
lsp.preset('recommended')

local util = require 'lspconfig.util'

--lsp.on_attach(function(client, bufnr)
  --lsp.default_keymaps({ buffer = bufnr })
--end)

lsp.ensure_installed({
  'ruby_ls',
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

require('lspconfig').denols.setup {
  --on_attach = on_attach,
  --on_attach = function(client)
    --print('hello eslint')
  --end,
  --root_dir = nvim_lsp.util.root_pattern("deno.json", "deno.jsonc"),
  --root_dir = require('lspconfig.util').util.root_pattern("deno.json", "deno.jsonc"),
  root_dir = util.root_pattern("deno.json", "deno.jsonc"),
}

require('lspconfig').tsserver.setup {
  --on_attach = on_attach,
  --root_dir = nvim_lsp.util.root_pattern("package.json"),
  root_dir = util.root_pattern("package.json"),
  single_file_support = false
}

lsp.nvim_workspace()

lsp.setup()
