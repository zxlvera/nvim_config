local status_ok, telescope = pcall(require, 'telescope')
local actions = require('telescope.actions')
local builtin = require('telescope.builtin')
local themes = require('telescope.themes')
local trouble = require("trouble.providers.telescope")

if status_ok then
  telescope.setup({
    defaults = {
      file_ignore_patterns = {
        "node_modules"
      },
      mappings = {
        i = {
          ["<c-t>"] = trouble.open_with_trouble,
          ["<c-h>"] = "which_key",
        },
        n = {
          ["<c-t>"] = trouble.open_with_trouble,
          ["<c-d>"] = actions.delete_buffer
        },
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
      file_browser = {
        theme = "ivy",
        hijack_netrw = true,
      }
    }
   }
  )
  telescope.load_extension('fzy_native')
  -- telescope.load_extension('git_worktree')
  telescope.load_extension('ui-select')
  telescope.load_extension('file_browser')
  -- return telescope.extensions.git_worktree.git_worktrees()

end
