vim.cmd [[packadd packer.nvim]]

return require('packer').startup(function(use)
  use 'wbthomason/packer.nvim'

  -- Startup Time
  use 'lewis6991/impatient.nvim'

  -- Sorting, Completion and linting
  use 'winston0410/commented.nvim'

  use {
    "williamboman/mason.nvim"
  }

  use {
    'neoclide/coc.nvim', 
    branch =  'release'
  }

  -- Indent
  use "lukas-reineke/indent-blankline.nvim"

  -- Autocomplete
  use 'hrsh7th/cmp-buffer'
  use 'hrsh7th/cmp-path'
  use 'hrsh7th/cmp-cmdline'
  use 'hrsh7th/nvim-cmp'
  use 'hrsh7th/cmp-nvim-lsp'
  use 'saadparwaiz1/cmp_luasnip'
  use { 'L3MON4D3/LuaSnip',
    dependencies = { "rafamadriz/friendly-snippets" }
  }

  -- Snippets
  use 'rafamadriz/friendly-snippets'

  -- Diganostics
  use { 'folke/trouble.nvim',
    requires = 'kyazdani42/nvim-web-devicons',
  }
  use {
      'nvim-treesitter/nvim-treesitter',
      run = ':TSUpdate'
  }
  use({
    'ray-x/navigator.lua',
    requires = {
        { 'ray-x/guihua.lua', run = 'cd lua/fzy && make' },
        { 'neovim/nvim-lspconfig' },
    },
  })
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
  use 'sainnhe/gruvbox-material'
  use 'arcticicestudio/nord-vim'
  use 'catppuccin/nvim'
  use 'sainnhe/everforest'
  use 'navarasu/onedark.nvim'
  use 'nvim-lualine/lualine.nvim'
  use 'folke/which-key.nvim'

  -- Search
  use { 'nvim-telescope/telescope.nvim',
    requires = { {'nvim-lua/plenary.nvim'} }
  }

  -- Navigation
  use {
    'kyazdani42/nvim-tree.lua',
    requires = {
        "kyazdani42/nvim-web-devicons",
    }
  }

  use 'kdheepak/lazygit.nvim'
  use 'lewis6991/gitsigns.nvim'

  if packer_bootstrap then
    require('packer').sync()
  end
end
)


