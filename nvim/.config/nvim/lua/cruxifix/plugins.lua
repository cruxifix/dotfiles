-- Install packer
local ensure_packer = function()
  local fn = vim.fn
  local install_path = fn.stdpath('data')..'/site/pack/packer/start/packer.nvim'
  if fn.empty(fn.glob(install_path)) > 0 then
    fn.system({'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path})
    vim.cmd [[packadd packer.nvim]]
    return true
  end
  return false
end

local packer_bootstrap = ensure_packer()

-- Install plugins
return require('packer').startup(function(use)
  use 'wbthomason/packer.nvim'

  -- colorscheme
  use({
    'folke/tokyonight.nvim',
    config = function ()
      vim.cmd[[colorscheme tokyonight]]
    end,
  })

  -- Treesitter
  use({
    'nvim-treesitter/nvim-treesitter',
    run = ':TSUpdate',
    requires = {
      'nvim-treesitter/playground',
      'nvim-treesitter/nvim-treesitter-textobjects',
      'JoosepAlviste/nvim-ts-context-commentstring',
    },
    config = function()
      require('cruxifix.plugins.treesitter')
    end,
  })

  -- THE finder
  use {
    'nvim-telescope/telescope.nvim', tag = '0.1.0',
    requires = { {'nvim-lua/plenary.nvim'} },
    config = function()
      require('cruxifix.plugins.telescope')
    end,
  }

  -- Code formatters
  use('williamboman/mason.nvim')
  use('williamboman/mason-lspconfig.nvim')
  use({
    'neovim/nvim-lspconfig',
    config = function()
      require('cruxifix.plugins.lspconfig')
    end,
  })

  -- Code completion
  use('hrsh7th/nvim-cmp')
  use({
    'hrsh7th/cmp-nvim-lsp',
    requires = 'L3MON4D3/LuaSnip',
    config = function()
      require('cruxifix.plugins.cmp')
    end,
  })

  -- Snippets
  use('saadparwaiz1/cmp_luasnip')
  use('rafamadriz/friendly-snippets')

  -- File mapper
  use({
    'theprimeagen/harpoon',
    config = function()
      require('cruxifix.plugins.harpoon')
    end,
  })

  -- Modern tree navigator
  use({
    'kyazdani42/nvim-tree.lua',
    requires = 'kyazdani42/nvim-web-devicons',
    config = function()
      require('cruxifix.plugins.nvim-tree')
    end,
  })

  -- Lualine
  use {
    'nvim-lualine/lualine.nvim',
    requires = { 'kyazdani42/nvim-web-devicons', opt = true },
    config = function()
      require('lualine').setup()
    end,
  }

  -- Autopairs
  use {
    'windwp/nvim-autopairs',
    config = function()
      require("nvim-autopairs").setup {}
    end,
  }

  -- Oldie but goodie
  use 'tpope/vim-surround'
  use 'tpope/vim-commentary'
  use 'tpope/vim-fugitive'
  use 'tpope/vim-abolish'
  use 'tpope/vim-unimpaired'
  use 'tpope/vim-vinegar'
  use 'tpope/vim-repeat'
  use 'tpope/vim-projectionist'

  -- Testing
  use({
    'vim-test/vim-test',
    config = function()
      require('cruxifix.plugins.vim-test')
    end,
  })

  -- Automatically set up your configuration after cloning packer.nvim
  -- Put this at the end after all plugins
  if packer_bootstrap then
    require('packer').sync()
  end
end)
