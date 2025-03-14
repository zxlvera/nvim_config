local Plugin = { 'nvim-neo-tree/neo-tree.nvim' }

Plugin.branch = 'v3.x'

Plugin.lazy = false

Plugin.dependencies = {
  "nvim-lua/plenary.nvim",
  "nvim-tree/nvim-web-devicons",     -- not strictly required, but recommended
  "MunifTanjim/nui.nvim",
}

function Plugin.init()
  -- disable netrw (neovim's default file explorer)
  vim.g.loaded_netrw = 1
  vim.g.loaded_netrwPlugin = 1
end

function Plugin.config()
  vim.keymap.set('n', '<leader>e', '<cmd>Neotree filesystem toggle<cr>', { desc = 'Toggle file explorer' })

  require('neo-tree').setup({
    filesystem = {
      commands = {
        avante_add_files = function(state)
          local node = state.tree:get_node()
          local filepath = node:get_id()
          local relative_path = require('avante.utils').relative_path(filepath)

          local sidebar = require('avante').get()

          local open = sidebar:is_open()
          -- ensure avante sidebar is open
          if not open then
            require('avante.api').ask()
            sidebar = require('avante').get()
          end

          sidebar.file_selector:add_selected_file(relative_path)

          -- remove neo tree buffer
          if not open then
            sidebar.file_selector:remove_selected_file('neo-tree filesystem [1]')
          end
        end,
      },
      window = {
        mappings = {
          ['oa'] = 'avante_add_files',
        },
      },
    },
  })
end

return Plugin
