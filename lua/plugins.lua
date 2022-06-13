vim.cmd [[packadd packer.nvim]]

return require('packer').startup(function(use)
  use 'wbthomason/packer.nvim'

  -- Completion and linting
  use 'winston0410/commented.nvim'
  use {
    'williamboman/nvim-lsp-installer',
    'neovim/nvim-lspconfig',
}
  -- Autocomplete
  use 'hrsh7th/cmp-buffer'
  use 'hrsh7th/cmp-path'
  use 'hrsh7th/cmp-cmdline'
  use 'hrsh7th/nvim-cmp'
  use 'hrsh7th/cmp-nvim-lsp'
  use 'saadparwaiz1/cmp_luasnip'
  use 'L3MON4D3/LuaSnip'
  -- Snippets
  use 'rafamadriz/friendly-snippets'

  -- Diganostics
  use { 'folke/trouble.nvim',
    requires = 'kyazdani42/nvim-web-devicons',
  }
  use { 'jose-elias-alvarez/null-ls.nvim', 
    requires = {{ 'nvim-lua/plenary.nvim'}}
  }
  use {
    'nvim-telescope/telescope-ui-select.nvim'
  }
  use {
    'nvim-telescope/telescope-fzy-native.nvim'
  }

  -- Pretty symbols, Color scheme, Status Line
  use 'kyazdani42/nvim-web-devicons'
  use 'arcticicestudio/nord-vim'
  use 'feline-nvim/feline.nvim'
  use 'folke/which-key.nvim'

  -- Search
  use { 'nvim-telescope/telescope.nvim',
    requires = { {'nvim-lua/plenary.nvim'} }
  }

  -- Navigation
  use {
    "nvim-neo-tree/neo-tree.nvim",
    branch = "v2.x",
      requires = {
        "nvim-lua/plenary.nvim",
        "kyazdani42/nvim-web-devicons",
        "MunifTanjim/nui.nvim",
      }
  }

  use 'lewis6991/gitsigns.nvim'

  if packer_bootstrap then
    require('packer').sync()
  end
end
)


