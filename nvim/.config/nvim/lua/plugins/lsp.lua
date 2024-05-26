return {
  "VonHeikemen/lsp-zero.nvim",
  branch = "v2.x",
  opts = {},
  dependencies = {
    "neovim/nvim-lspconfig",
    "williamboman/mason.nvim", -- new-style: not working?
    -- {                            -- old-style config for mason: working?
    --   "williamboman/mason.nvim",
    --   run = function()
    --     pcall(vim.cmd, "MasonUpdate")
    --   end,
    -- },
    "williamboman/mason-lspconfig.nvim",

    "neovim/nvim-lspconfig",
    "hrsh7th/nvim-cmp",
    "hrsh7th/cmp-nvim-lsp",
    "L3MON4D3/LuaSnip",

    "hrsh7th/cmp-buffer",
    "hrsh7th/cmp-path",
    "saadparwaiz1/cmp_luasnip",
    "hrsh7th/cmp-nvim-lua",

    "rafamadriz/friendly-snippets"
  },
  config = function()
    local lsp = require("lsp-zero")
    lsp.preset("recommended")

    lsp.ensure_installed({
      "ruby_ls",
      --"erb_lint",
      --"tsserver",
      --"eslint",
      "lua_ls",
    })

    lsp.nvim_workspace()

    lsp.setup()
  end
}
