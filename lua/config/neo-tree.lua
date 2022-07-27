local status_ok, neotree = pcall(require, 'neo-tree')
if status_ok then
  return neotree.setup({
    close_if_last_window = "false",
    popup_border_style = "rounded",
    enable_git_status = "true",
    default_component_configs = {
      window = {
        position = "left",
        width = 20,
        mapping_options = {
          noremap = true,
          nowait = true,
        }
      },
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


