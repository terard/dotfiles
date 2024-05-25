vim.cmd [[packadd packer.nvim]]

return require('packer').startup(function(use)
  -- Packer can manage itself
  use 'wbthomason/packer.nvim'

  use {
    'nvim-telescope/telescope.nvim', tag = '0.1.0',
    -- or                            , branch = '0.1.x',
    requires = { { 'nvim-lua/plenary.nvim' } }
  }

  --use { "ellisonleao/gruvbox.nvim" }
  use { "catppuccin/nvim", as = "catppuccin" }
  --use({
  --'rose-pine/neovim',
  --as = 'rose-pine',
  --config = function()
  --vim.cmd('colorscheme rose-pine')
  --end
  --})

  use {
    'nvim-treesitter/nvim-treesitter',
    run = ':TSUpdate'
  }
  use { 'nvim-treesitter/playground' }

  use { 'theprimeagen/harpoon' }
  --use { 'mbbill/undotree' }
  use { 'tpope/vim-fugitive' }

  --use {
  --'VonHeikemen/lsp-zero.nvim',
  --requires = {
  ---- LSP Support
  --{ 'neovim/nvim-lspconfig' },
  --{ 'williamboman/mason.nvim' },
  --{ 'williamboman/mason-lspconfig.nvim' },

  ---- Autocompletion
  --{ 'hrsh7th/nvim-cmp' },
  --{ 'hrsh7th/cmp-buffer' },
  --{ 'hrsh7th/cmp-path' },
  --{ 'saadparwaiz1/cmp_luasnip' },
  --{ 'hrsh7th/cmp-nvim-lsp' },
  --{ 'hrsh7th/cmp-nvim-lua' },

  ---- Snippets
  --{ 'L3MON4D3/LuaSnip' },
  --{ 'rafamadriz/friendly-snippets' },
  --}
  --}
  --
  use {
    'VonHeikemen/lsp-zero.nvim',
    branch = 'v2.x',
    requires = {
      -- LSP Support
      { 'neovim/nvim-lspconfig' }, -- Required
      {                            -- Optional
        'williamboman/mason.nvim',
        run = function()
          pcall(vim.cmd, 'MasonUpdate')
        end,
      },
      { 'williamboman/mason-lspconfig.nvim' }, -- Optional

      -- Autocompletion
      { 'hrsh7th/nvim-cmp' },     -- Required
      { 'hrsh7th/cmp-nvim-lsp' }, -- Required
      { 'L3MON4D3/LuaSnip' },     -- Required
      { 'hrsh7th/cmp-buffer' },
      { 'hrsh7th/cmp-path' },
      { 'saadparwaiz1/cmp_luasnip' },
      { 'hrsh7th/cmp-nvim-lua' },

      { 'rafamadriz/friendly-snippets' },

    }
  }

  use { 'kassio/neoterm' }
  use { 'vim-test/vim-test' }

  use { 'windwp/nvim-ts-autotag' }
  use {
    "windwp/nvim-autopairs",
    config = function() require("nvim-autopairs").setup {} end
  }

  -- from old
  use { 'roman/golden-ratio' }
  use { 'scrooloose/nerdcommenter' }
  use { 'osyo-manga/vim-over' }
  use { 'tpope/vim-surround' }

  use { 'github/copilot.vim' }

  -- new
  use { 'kchmck/vim-coffee-script' }
  use { 'ThePrimeagen/git-worktree.nvim' }
  use { 'mhartington/formatter.nvim' }
  use { 'tkatsu/vim-erblint' }

  use "lukas-reineke/indent-blankline.nvim"
  local highlight = {
    "RainbowRed",
    "RainbowYellow",
    "RainbowBlue",
    "RainbowOrange",
    "RainbowGreen",
    "RainbowViolet",
    "RainbowCyan",
  }

  local hooks = require "ibl.hooks"
  -- create the highlight groups in the highlight setup hook, so they are reset
  -- every time the colorscheme changes
  hooks.register(hooks.type.HIGHLIGHT_SETUP, function()
    vim.api.nvim_set_hl(0, "RainbowRed", { fg = "#E06C75" })
    vim.api.nvim_set_hl(0, "RainbowYellow", { fg = "#E5C07B" })
    vim.api.nvim_set_hl(0, "RainbowBlue", { fg = "#61AFEF" })
    vim.api.nvim_set_hl(0, "RainbowOrange", { fg = "#D19A66" })
    vim.api.nvim_set_hl(0, "RainbowGreen", { fg = "#98C379" })
    vim.api.nvim_set_hl(0, "RainbowViolet", { fg = "#C678DD" })
    vim.api.nvim_set_hl(0, "RainbowCyan", { fg = "#56B6C2" })
  end)

  require("ibl").setup { indent = { highlight = highlight } }
end)
