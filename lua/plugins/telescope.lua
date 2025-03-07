local Plugin = { 'nvim-telescope/telescope.nvim' }
local is_unix = vim.fn.has('unix') == 1 or vim.fn.has('mac') == 1

Plugin.branch = '0.1.x'

Plugin.build = false

Plugin.dependencies = {
  { 'nvim-lua/plenary.nvim',                 build = false },
  { 'natecraddock/telescope-zf-native.nvim', build = false },
}

Plugin.cmd = { 'Telescope' }

Plugin.extensions = {
  aerial = {
    -- Set the width of the first two columns (the second
    -- is relevant only when show_columns is set to 'both')
    col1_width = 4,
    col2_width = 30,
    -- How to format the symbols
    format_symbol = function(symbol_path, filetype)
      if filetype == "json" or filetype == "yaml" then
        return table.concat(symbol_path, ".")
      else
        return symbol_path[#symbol_path]
      end
    end,
    -- Available modes: symbols, lines, both
    show_columns = "both",
  },
}

function Plugin.init()
  -- See :help telescope.builtin
  vim.keymap.set('n', '<leader>?', '<cmd>Telescope oldfiles<cr>', { desc = 'Search file history' })
  vim.keymap.set('n', '<leader><space>', '<cmd>Telescope buffers<cr>', { desc = 'Search open files' })
  vim.keymap.set('n', '<leader>ff', '<cmd>Telescope find_files<cr>', { desc = 'Search all files' })
  vim.keymap.set('n', '<leader>fg', '<cmd>Telescope live_grep<cr>', { desc = 'Search in project' })
  vim.keymap.set('n', '<leader>fd', '<cmd>Telescope diagnostics<cr>', { desc = 'Search diagnostics' })
  vim.keymap.set('n', '<leader>fs', '<cmd>Telescope current_buffer_fuzzy_find<cr>', { desc = 'Buffer local search' })
end

function Plugin.config()
  pcall(require('telescope').load_extension, 'zf-native')
end

return Plugin
