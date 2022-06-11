local status_ok, telescope = pcall(require, 'telescope')
local themes = require('telescope.themes')
if status_ok then
  telescope.setup({
    extensions = {
      ['ui-select'] = {
        themes.get_dropdown{}
      }
    }
  })
  return telescope.load_extension('ui-select')
end
