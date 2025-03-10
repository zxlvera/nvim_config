local Plugin = { 'nvim-neo-tree/neo-tree.nvim' }

Plugin.branch = 'v3.x'

Plugin.lazy = false

Plugin.dependencies = {
      "nvim-lua/plenary.nvim",
      "nvim-tree/nvim-web-devicons", -- not strictly required, but recommended
      "MunifTanjim/nui.nvim",
}

function Plugin.init()
  -- disable netrw (neovim's default file explorer)
  vim.g.loaded_netrw = 1
  vim.g.loaded_netrwPlugin = 1
end

function Plugin.config()
  vim.keymap.set('n', '<leader>e', '<cmd>Neotree filesystem toggle<cr>', {desc = 'Toggle file explorer'})

  require('neo-tree').setup({})
end

return Plugin
