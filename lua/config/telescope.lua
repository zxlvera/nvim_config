local status_ok, telescope = pcall(require, 'telescope')
local themes = require('telescope.themes')
if status_ok then
  telescope.setup({
    defaults = {
      file_ignore_patterns = {
        "node_modules"
      }
    },
    extensions = {
      ['ui-select'] = {
        themes.get_dropdown{}
      },
      fzy_native = {
        override_generic_sorter = false,
        override_file_sorter = true,
      }
    }
  })
  telescope.load_extension('fzy_native')
  telescope.load_extension('ui-select')

end
