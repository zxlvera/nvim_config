local status_ok, neotree = pcall(require, 'neo-tree')
if status_ok then
  return neotree.setup({
    popup_border_style = "rounded",
    enable_git_status = "true",
    window = {
      position = "float",
    },
    default_component_configs = {
      git_status = {
        symbols = {
          added = "A",
          modified = "M",
          deleted = "D",
          renamed = "R",
          untracked = "",
          ignored = "",
          unstaged = "",
          staged = "",
          conflict = ""
        }
      }
    }
  })
end


