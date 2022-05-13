local capabilities = require('cmp_nvim_lsp').update_capabilities(vim.lsp.protocol.make_client_capabilities())

require'lspconfig'.rust_analyzer.setup{
  capabilities=capabilities,
  on_attach = function()
  vim.keymap.set("n", "K", vim.lsp.buf.hover, {buffer=0})
  vim.keymap.set("n", "gd", vim.lsp.buf.definition, {buffer=0}) -- ctrl-t to manage taglist 
  vim.keymap.set("n", "gt", vim.lsp.buf.type_definition, {buffer=0}) -- not working in rust?
  vim.keymap.set("n", "gi", vim.lsp.buf.implementation, {buffer=0}) 
  vim.keymap.set("n", "gr", "<cmd>Telescope lsp_references<cr>", {buffer=0}) 
  vim.keymap.set("n", "<leader>R", vim.lsp.buf.rename, {buffer=0}) 
  vim.keymap.set("n", " dj", vim.diagnostic.goto_next, {buffer=0}) 
  vim.keymap.set("n", " dk", vim.diagnostic.goto_prev, {buffer=0}) 
  vim.keymap.set("n", " dl", "<cmd>Telescope diagnostics<cr>", {buffer=0}) 
  end,
}

-- not sure this is working very well (for ruby and rails)
require'lspconfig'.solargraph.setup{
  capabilities=capabilities,
  on_attach = function()
  vim.keymap.set("n", "K", vim.lsp.buf.hover, {buffer=0})
  vim.keymap.set("n", "gd", vim.lsp.buf.definition, {buffer=0}) -- ctrl-t to manage taglist 
  vim.keymap.set("n", "gt", vim.lsp.buf.type_definition, {buffer=0}) -- not working in rust?
  vim.keymap.set("n", "gi", vim.lsp.buf.implementation, {buffer=0}) 
  vim.keymap.set("n", "gr", "<cmd>Telescope lsp_references<cr>", {buffer=0}) 
  vim.keymap.set("n", "<leader>R", vim.lsp.buf.rename, {buffer=0}) 
  vim.keymap.set("n", " dj", vim.diagnostic.goto_next, {buffer=0}) 
  vim.keymap.set("n", " dk", vim.diagnostic.goto_prev, {buffer=0}) 
  vim.keymap.set("n", " dl", "<cmd>Telescope diagnostics<cr>", {buffer=0}) 
  end,
  flags = {
    debounce_text_changes = 150,
  }
}

-- set completeopt=menu,menuone,noselect
-- is the same as (cool lua way):
vim.opt.completeopt={"menu","menuone","noselect"}

-- Setup nvim-cmp.
local cmp = require'cmp'

cmp.setup({
  snippet = {
    expand = function(args)
      require('luasnip').lsp_expand(args.body) -- For `luasnip` users.
    end,
  },
  window = {
    -- completion = cmp.config.window.bordered(),
    -- documentation = cmp.config.window.bordered(),
  },
  mapping = cmp.mapping.preset.insert({
    ['<C-b>'] = cmp.mapping.scroll_docs(-4),
    ['<C-f>'] = cmp.mapping.scroll_docs(4),
    ['<C-Space>'] = cmp.mapping.complete(),
    ['<C-e>'] = cmp.mapping.abort(),
    ['<CR>'] = cmp.mapping.confirm({ select = true }), -- Accept currently selected item. Set `select` to `false` to only confirm explicitly selected items.
  }),
  sources = cmp.config.sources({
    { name = 'nvim_lsp' },
    { name = 'luasnip' }, -- For luasnip users.
  }, {
    { name = 'buffer' },
  })
})