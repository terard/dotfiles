vim.cmd [[packadd packer.nvim]]

return require('packer').startup(function(use)
  -- Packer can manage itself
  use 'wbthomason/packer.nvim'

  use {
    'VonHeikemen/lsp-zero.nvim',
    branch = 'v3.x',
    requires = {
      -- LSP Support
      { 'neovim/nvim-lspconfig' }, -- Required
      {
        -- Optional
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

  use {
    'nvim-telescope/telescope.nvim', tag = '0.1.0',
    -- or                            , branch = '0.1.x',
    requires = { { 'nvim-lua/plenary.nvim' } }
  }

  --use { "ellisonleao/gruvbox.nvim" }
  --use({
  --'rose-pine/neovim',
  --as = 'rose-pine',
  --config = function()
  --vim.cmd('colorscheme rose-pine')
  --end
  --})

  use { "catppuccin/nvim", as = "catppuccin" }

  use {
    'nvim-treesitter/nvim-treesitter',
    run = ':TSUpdate'
  }
  use { 'nvim-treesitter/playground' }
  use { "nvim-treesitter/nvim-treesitter-context" }

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

  use { 'kassio/neoterm' }

  use { 'windwp/nvim-ts-autotag' }
  use {
    "windwp/nvim-autopairs",
    config = function() require("nvim-autopairs").setup {} end
  }

  use {
    "folke/twilight.nvim",
    config = function()
      require("twilight").setup {
        {
          dimming = {
            alpha = 0.25, -- amount of dimming
            -- we try to get the foreground from the highlight groups or fallback color
            color = { "Normal", "#ffffff" },
            term_bg = "#000000", -- if guibg=NONE, this will be used to calculate text color
            inactive = false,    -- when true, other windows will be fully dimmed (unless they contain the same buffer)
          },
          context = 30,          -- amount of lines we will try to show around the current line
          treesitter = true,     -- use treesitter when available for the filetype
          -- treesitter is used to automatically expand the visible text,
          -- but you can further control the types of nodes that should always be fully expanded
          expand = { -- for treesitter, we we always try to expand to the top-most ancestor with these types
            "function",
            "method",
            "table",
            "if_statement",
          },
          exclude = {}, -- exclude these filetypes
        }
      }
    end
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
  use { 'tpope/vim-rails' }
  use {
    'nvim-lualine/lualine.nvim',
    requires = { 'nvim-tree/nvim-web-devicons', opt = true },
  }
  require('lualine').setup {
    sections = {
      lualine_a = {
        {
          'filename',
          file_status = true,
          path = 1
        }
      }
    }
  }
  use { 'stevearc/dressing.nvim' }
  use { 'vim-test/vim-test' }

  --use {
  --"nvim-neotest/neotest",
  --requires = {
  --"nvim-lua/plenary.nvim",
  --"nvim-treesitter/nvim-treesitter",
  --"antoinemadec/FixCursorHold.nvim",
  --"olimorris/neotest-rspec"
  --},
  --config = function()
  --require("neotest").setup({
  --adapters = {
  --require("neotest-rspec"),
  --}
  --})
  --end
  --}
  use { "akinsho/toggleterm.nvim", tag = '*', config = function()
    require("toggleterm").setup()
  end }

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
    --vim.api.nvim_set_hl(0, "RainbowRed", { fg = "#E06C75" })
    vim.api.nvim_set_hl(0, "RainbowRed", { fg = "#BF616A" })
    --vim.api.nvim_set_hl(0, "RainbowYellow", { fg = "#E5C07B" })
    vim.api.nvim_set_hl(0, "RainbowYellow", { fg = "#EBCB8B" })
    --vim.api.nvim_set_hl(0, "RainbowBlue", { fg = "#61AFEF" })
    vim.api.nvim_set_hl(0, "RainbowBlue", { fg = "#5E81AC" })
    --vim.api.nvim_set_hl(0, "RainbowOrange", { fg = "#D19A66" })
    vim.api.nvim_set_hl(0, "RainbowOrange", { fg = "#D08770" })
    --vim.api.nvim_set_hl(0, "RainbowGreen", { fg = "#98C379" })
    vim.api.nvim_set_hl(0, "RainbowGreen", { fg = "#A3BE8C" })
    --vim.api.nvim_set_hl(0, "RainbowViolet", { fg = "#C678DD" })
    vim.api.nvim_set_hl(0, "RainbowViolet", { fg = "#B48EAD" })
    --vim.api.nvim_set_hl(0, "RainbowCyan", { fg = "#56B6C2" })
    vim.api.nvim_set_hl(0, "RainbowCyan", { fg = "#88C0D0" })
  end)

  require("ibl").setup { indent = { highlight = highlight } }
  --require("ibl").setup()

  --use({
  --"roobert/search-replace.nvim",
  --config = function()
  --require("search-replace").setup({
  ---- optionally override defaults
  --default_replace_single_buffer_options = "gcI",
  --default_replace_multi_buffer_options = "egcI",
  --})
  --end,
  --})
end)
