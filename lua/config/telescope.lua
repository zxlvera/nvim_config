local status_ok, telescope = pcall(require, 'telescope')
local builtin = require('telescope.builtin')
local themes = require('telescope.themes')
local trouble = require("trouble.providers.telescope")

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
      },
    },
    mappings = {
      i = {
        ["<C-h>"] = "which_key",
        ["<c-t>"] = trouble.open_with_trouble
      },
      n = {
        ["<c-t>"] = trouble.open_with_trouble 
      },
     }
    }
  )
  telescope.load_extension('fzy_native')
  telescope.load_extension('git_worktree')
  telescope.load_extension('ui-select')
  -- return telescope.extensions.git_worktree.git_worktrees()

end
